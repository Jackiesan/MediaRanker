require "test_helper"

describe WorksController do
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should get post" do
    get work_path(works(:book_1).id)
    must_respond_with :success
  end

  it "should redirect to the home page when going to the edit page of work that does not exist" do
    get edit_work_path 'foo'

    must_respond_with :redirect
    must_redirect_to root_path
  end

  describe "create" do
    it "Successfully creates a Work with valid data" do
      proc {
        post works_path, params: {
          work: {
            title: "New Title", category: "book"
          }
        }
      }.must_change 'Work.count', 1

      must_respond_with :redirect
      must_redirect_to works_path
    end


  end

  describe "update" do
    it "updates an Work's title when given a valid title and valid category" do
      updated_title = "Brand New"
      # Act
      patch work_path works(:book_1).id, params: {
        work: {
          title: updated_title, category: "book"
        }
      }

      updated_work = Work.find(works(:book_1).id)
      updated_work.title.must_equal updated_title
      must_respond_with :redirect
    end
  end


end
