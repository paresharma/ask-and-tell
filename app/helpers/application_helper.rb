# frozen_string_literal: true

module ApplicationHelper
  def markup(content)
    Markup.renderer.render content || ''
  end
end
