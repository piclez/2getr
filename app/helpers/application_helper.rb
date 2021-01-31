module ApplicationHelper
  def user_gravatar
    gravatar_id = Digest::MD5::hexdigest(current_user.email.downcase)
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: current_user.email,
      class: 'shadow-xl rounded-full h-auto align-middle border-none absolute -m-16 -ml-20 lg:-ml-16',
      style: 'max-width: 150px')
  end
end
