module NavigationLinksHelper

  def index_link_to(page_title, page_ref)
    link_to page_title, workshop_path(page: page_ref), class: 'btn btn-lg index_link'
  end

  def back_link(target_page_ref)
    link_to icon_text(false, 'fa-arrow-left'),
    ( workshop_path(page: target_page_ref) if target_page_ref ) || '#',
    class: 'btn',
    disabled: !target_page_ref
  end

  def forward_link(target_page_ref, text=nil)
    link_to icon_text( ( "Next: #{text}" if text ), 'fa-arrow-right'),
    ( workshop_path(page: target_page_ref) if target_page_ref ) || '#',
    class: 'btn',
    disabled: !target_page_ref
  end


end
