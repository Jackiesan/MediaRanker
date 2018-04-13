class User < ApplicationRecord
  has_many :votes
  validates :name, presence: true, uniqueness: true
  validates_length_of :name, :minimum => 1, :allow_nil => true

end
