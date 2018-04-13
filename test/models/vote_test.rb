require "test_helper"


describe Vote do
  let(:vote_1) { votes(:vote_1) }

  it "must be valid" do

    value(vote_1).must_be :valid?
  end

  it "must not be valid without a user" do
    vote_1.user = nil
    value(vote_1).wont_be :valid?
    vote_1.errors.messages.must_include :user
  end

  it "must not be valid without a work" do
    vote_1.work = nil
    value(vote_1).wont_be :valid?
    vote_1.errors.messages.must_include :work
  end


end
