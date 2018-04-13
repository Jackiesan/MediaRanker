class Work < ApplicationRecord
  validates :title, presence: true
  validates_uniqueness_of :title, scope: :category
  validates :category, presence: true, inclusion: { in: %w(book movie album), message: "%{value} is not a valid category" }
  has_many :votes, dependent: :destroy



  def self.spotlight
    return Work.all.sort_by{|work| -work.votes.count}.first
  end

  def self.order_by_vote
    return Work.all.sort_by{|work| -work.votes.count}
  end


end
