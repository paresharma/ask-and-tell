class Answer < ApplicationRecord
  include Permission

  belongs_to :question
  belongs_to :user

  default_scope -> { includes(:question).order('id DESC') }

  validates :description, presence: true
end
