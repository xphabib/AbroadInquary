module UsersHelper
  def user_image(user)
    user.image.present? ? "#{user.image_url}" :'avatar1-72.jpg'
  end
end
