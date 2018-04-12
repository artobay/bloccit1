module ApplicationHelper
    def markdown
    Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    renderer.render(text).html_safe
    end
end
