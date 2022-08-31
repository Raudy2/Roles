module ApplicationHelper
  include Pagy::Frontend


  def can_edit?(resource)
    return false unless user_signed_in?

    current_user.can_edit?(resource)
  end

  def can_create?(resource)
    return false unless user_signed_in?

    current_user.can_create?(resource)
  end
end
