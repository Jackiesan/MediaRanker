class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  validates :user, presence: true
  validates :work, presence: true, uniqueness: {scope: :user, message: "user: has already voted for this work" }



end
