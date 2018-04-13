require "test_helper"


describe User do
  let(:dan) { users(:dan) }
  let(:duplicate_dan) { User.create(name: "dan") }

  it "must be valid" do
    value(dan).must_be :valid?
  end

  it "is invalid with nil name" do
    value(dan).must_be :valid?
    dan.name = nil
    value(dan).wont_be :valid?
    dan.errors.messages.must_include :name
  end

  it "will not create a new user with the same name as existing user" do
    value(duplicate_dan).wont_be :valid?
  end


end
