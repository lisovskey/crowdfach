module ProjectsHelper
  def to_markdown(text)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render text
  end
end
