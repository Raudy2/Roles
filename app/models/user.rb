class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :pwned_password unless Rails.env.test?

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  def can_edit?(resource)

    # User.class => "Class"
    # User.name => "User"
    # User.first.class => "User"
    resource_class = resource.class.to_s == "Class" ? resource.name : resource.class.to_s
    role = roles.where(reference: resource_class)
    return false unless role 

    role.map(&:createable?).any?

  end

  def can_create?(resource)
    resource_class = resource.class.to_s == "Class" ? resource.name : resource.class.to_s
    role = roles.where(reference: resource_class)
    return false unless role 

    role.map(&:editable?).any? || role.map(&:createable?).any?
  end


  # enum role: {
  #   normal: 0,
  #   admin: 1
  # }

  # def user_params
  #   allowed_attributes = [:email, :name, :username]
  #   if user_signed_in? && current_user.admin?
  #     allowed_attributes << :role
  #   end
  #   params.require(:user).permit[allowed_attributes]
  # end
end
