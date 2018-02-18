# frozen_string_literal: true

class Answer < ApplicationRecord
  include Permissible

  belongs_to :question
  belongs_to :user

  default_scope -> { includes(:question).order('id DESC') }

  validates :description, presence: true
end
