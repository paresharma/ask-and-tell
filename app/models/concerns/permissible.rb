# frozen_string_literal: true

module Permissible
  extend ActiveSupport::Concern

  def can_be_administered_by(user)
    return false unless user.present?
    user.id == user_id
  end
end
