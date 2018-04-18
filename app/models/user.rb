class User < ApplicationRecord
  has_many :votes


  # validates :name, presence: true, uniqueness: { case_sensitive: false }
  # validates_length_of :name, :minimum => 1, :allow_nil => true

  def self.build_from_github(auth_hash)
    User.new(
      provider: auth_hash[:provider], uid: auth_hash[:uid], email: auth_hash[:info][:email], name: auth_hash[:info][:name]
    )
  end

end
