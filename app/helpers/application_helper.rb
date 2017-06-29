module ApplicationHelper
  def wrapper_except_home
    "wrapper" unless current_page?(root_url)
  end
def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		d = "mm"
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=600&d=mm"
		image_tag(gravatar_url, alt: "#{user.name}")
	end
end
