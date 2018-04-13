class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  validates :user, presence: true
  validates :user, uniqueness: {scope: :work, message: "user: has already voted for this work" }





end
