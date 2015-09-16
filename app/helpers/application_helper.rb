module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end
  def markdown(text)
render_options = {
  # will remove from the output HTML tags inputted by user
  filter_html:     true,
  # will insert <br /> tags in paragraphs where are newlines
  # (ignored by default)
  hard_wrap:       true,
  # hash for extra link options, for example 'nofollow'
  link_attributes: { rel: 'nofollow' }
  # more
  # will remove <img> tags from output
  # no_images: true
  # will remove <a> tags from output
  # no_links: true
  # will remove <style> tags from output
  # no_styles: true
  # generate links for only safe protocols
  # safe_links_only: true
  # and more ... (prettify, with_toc_data, xhtml)
}
renderer = Redcarpet::Render::HTML.new(render_options)

extensions = {
  #will parse links without need of enclosing them
  autolink:           true,
  # blocks delimited with 3 ` or ~ will be considered as code block.
  # No need to indent.  You can provide language name too.
  # ```ruby
  # block of code
  # ```
  fenced_code_blocks: true,
  # will ignore standard require for empty lines surrounding HTML blocks
  lax_spacing:        true,
  # will not generate emphasis inside of words, for example no_emph_no
  no_intra_emphasis:  true,
  # will parse strikethrough from ~~, for example: ~~bad~~
  strikethrough:      true,
  # will parse superscript after ^, you can wrap superscript in ()
  superscript:        true
  # will require a space after # in defining headers
  # space_after_headers: true
}
Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
end
end
