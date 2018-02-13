class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  default_scope -> { includes(:question).order('id DESC') }
end
