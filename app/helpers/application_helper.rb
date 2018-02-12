module ApplicationHelper
  def markup(content)
    Markup.renderer.render content || ''
  end
end
