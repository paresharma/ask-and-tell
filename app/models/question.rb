class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  default_scope -> { includes(:user) }

  include PgSearch
  pg_search_scope :search_by_title_or_description,
    against: [:title, :description],
    using: { tsearch: { dictionary: 'english' }}
    # associated_against: { author: :title, comments: [:title, :description] },
    # ignoring: :accents

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true

  def self.search(query)
    if query.present?
      search_by_title_or_description(query)
      # rank = <<-RANK
      #   ts_rank(to_tsvector(title), plainto_tsquery('#{ActionController::Base.helpers.sanitize(query)}'))
      # RANK
      # where("to_tsvector('english', title) @@ :q or to_tsvector('english', description) @@ :q", q: query).order("#{rank} desc")
    else
      all
    end
  end
end
