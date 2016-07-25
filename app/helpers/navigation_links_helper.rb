module NavigationLinksHelper

  def back_link(target_page_ref)
    link_to icon_text(false, 'fa-arrow-left'),
    workshop_path(page: ( target_page_ref || '1/1') ),
    class: 'btn',
    disabled: !target_page_ref
  end

  def forward_link(target_page_ref, text)
    link_to icon_text("Next: #{text}", 'fa-arrow-right'),
    workshop_path(page: target_page_ref),
    class: 'btn'
  end


end
