require "test_helper"


describe Vote do
  let(:vote_1) { votes(:vote_1) }
  let(:vote_2) { Vote.new(user: users(:dan), work: works(:book_1)) }

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

  it "vote will not be created if user has already voted for that work" do
    value(vote_2).wont_be :valid?
  end

  describe 'relations' do
    let(:vote_2) { votes(:vote_2) }

    it 'has a user' do
      value(vote_2).must_be :valid?
      vote_2.user.must_equal users(:chris)
    end

    it 'can set the user' do
      vote_2.user = users(:dee)
      vote_2.user.must_equal users(:dee)
    end

    it 'has a work' do
      vote_2.work.must_equal works(:book_1)
    end

    it 'can set the work' do
      vote_2.work = works(:movie_1)
      vote_2.work.must_equal works(:movie_1)
    end

  end

end
