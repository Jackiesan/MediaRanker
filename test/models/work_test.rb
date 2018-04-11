require "test_helper"

describe Work do
  it "must be valid" do
    work = works(:book_1)
    value(work).must_be :valid?
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
    work = works(:book_1)

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

end
