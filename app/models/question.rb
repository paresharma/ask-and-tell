# frozen_string_literal: true

class Question < ApplicationRecord
  include Permissible
  include PgSearch

  belongs_to :user
  has_many :answers, dependent: :destroy

  default_scope -> { includes(:user).order('id DESC') }

  pg_search_scope :search_by_title_or_description,
                  against: %i[title description],
                  using: { tsearch: { dictionary: 'english' } }
  # associated_against: { author: :title, comments: [:title, :description] },
  # ignoring: :accents

  validates :title,
            presence: true,
            uniqueness: true,
            length: { maximum: 200 }

  validates :description, presence: true

  def self.search(query = nil)
    if query.present?
      search_by_title_or_description(query)
      # rank = <<-RANK
      #   ts_rank(
      #     to_tsvector(title),
      #     plainto_tsquery('#{ActionController::Base.helpers.sanitize(query)}')
      #   )
      # RANK
      # where(
      #   "to_tsvector('english', title) " \
      #   "@@ :q or to_tsvector('english', description) @@ :q", q: query
      # ).order("#{rank} desc")
    else
      all
    end
  end
end
