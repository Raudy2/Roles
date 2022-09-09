module UsersHelper
  def user_avatar(user, options = {})
    size = options[:size] || 48
    classes = options[:class]


    if user.avatar.attached? && user.avatar.variable?
      image_tag(
        user.avatar.variant(resize_to_fit: [size, size]),
        class: classes,
        alt: user.name
      )
    else
     
    end
  end
end