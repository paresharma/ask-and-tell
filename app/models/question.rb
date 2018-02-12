class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  default_scope -> { includes(:user) }

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
end
