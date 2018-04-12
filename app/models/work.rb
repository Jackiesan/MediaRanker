class Work < ApplicationRecord
  validates :title, presence: true
  validates_uniqueness_of :title, scope: :category
  validates :category, presence: true, inclusion: { in: %w(book movie album), message: "%{value} is not a valid category" }
  has_many :votes
end
