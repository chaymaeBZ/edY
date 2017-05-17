module ApplicationHelper
  def wrapper_except_home
    "wrapper" unless current_page?(root_url)
  end
end
