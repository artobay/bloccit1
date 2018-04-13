module ApplicationHelper
  def render_markdown(text)
  renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  renderer.render(text).html_safe
end
end
