require "test_helper"

describe Work do
  let(:book_1) { works(:book_1) }

  it "must be valid" do
    value(book_1).must_be :valid?
  end

  it "must be invalid without a category" do
    work = works(:book_1)
    work.category = nil
    value(work).wont_be :valid?
  end

  it "must be invalid without a title" do
    work = works(:book_1)
    work.title = nil
    value(work).wont_be :valid?
  end

  it "must be valid with a supported category type" do
    work = book_1

    categories = ["movie", "book", "album"]
    categories.each do |category|
      work.category = category
      value(work).must_be :valid?
    end
  end


  it "must be invalid without a supported category type" do
    work = works(:book_1)
    work.category = "safkldjsaf"
    value(work).wont_be :valid?
  end
  let(:duplicate_book_title) { Work.create(title: "Goodnight Moon") }


  it "work will not be created if title is not unique within category" do
    value(duplicate_book_title).wont_be :valid?
  end

  it "will create work with duplicate title but with different category" do
    new_work = Work.create(title: "Goodnight Moon", category: "movie")
    new_work.must_be :valid?
  end

end

describe Work do
  describe "work#self.spotlight method" do
    #most voted work book_1
    let(:book_1) { works(:book_1) }

    it "selects the work with the top vote" do
      top_voted = Work.spotlight
      top_voted.must_equal book_1
    end
  end

  describe "work#order_by_vote method" do
    # works in desc order from most to least votes
    let(:book_1) { works(:book_1) }
    let(:movie_1) { works(:movie_1) }
    let(:book_2) { works(:book_2) }
    let(:book_3) { works(:book_3) }


    it "arranges works in descending order from most votes to least" do
      ordered_works = Work.order_by_vote
      ordered_works[0].must_equal book_1
      ordered_works[1].must_equal movie_1
      ordered_works[2].must_equal book_2
      ordered_works[3].must_equal book_3

    end
  end
end
