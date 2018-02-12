module Markup
  def self.renderer
    @_markdown ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(hard_wrap: true, prettify: true),
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true
    )
  end
end
