module BodyHelper

  def page_body(body)
    content_tag(:div, class: 'flatchat_page container-fluid') do
      content_tag(:div, class: "page_header clearfix") do
        ( controller_name == 'workshops' ? workshop_index_link : ''.html_safe ) +
        ( controller_name == 'homes' ? ''.html_safe : home_link )
      end +
      flash_messages +
      body
    end
  end

  def workshop_index_link
    link_to(workshop_path, class: "page_navigation_link btn btn-lg") do
      icon 'fa-list-ul'
    end
  end

  def home_link
    link_to(root_path, class: "page_navigation_link btn btn-lg pull-right") do
      icon 'fa-times'
    end
  end

end
