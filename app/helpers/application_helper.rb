module ApplicationHelper

  def full_title page_title = ""
    base_tile = "Demo App"
    page_title.empty? ? base_tile : "#{page_title} | + #{base_tile}"
  end
end
