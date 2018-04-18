require "test_helper"

describe SessionsController do
  #   it "should get create" do
  #     get sessions_create_url
  #     value(response).must_be :success?
  #   end
  #
  #   it "should get destroy" do
  #     get sessions_destroy_url
  #     value(response).must_be :success?
  #   end
  #
  #   it "should get new" do
  #     get sessions_new_url
  #     value(response).must_be :success?
  #   end

  describe "create" do
    it "should log in an existing user and redirect to the root route" do
      before_count = User.count

      existing_user = users(:ada)
      # Tell OmniAuth to use this user's info when it sees
      # an auth callback from github
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(existing_user))

      # get auth_callback_path('github')
      proc {
        get auth_callback_path(existing_user.provider)
      }.must_change 'User.count', 0

      must_redirect_to root_path
      User.count.must_equal before_count
    end

    it "should create a new user and redirect to the root route" do
      new_user = User.new(
        provider: 'github',
        uid: 999,
        name: 'test user',
        email: 'test@test.com',
      )

      # OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(new_user))
      #
      # proc {
      #   get auth_callback_path(new_user.provider)
      # }.must_change 'User.count', 1
      proc {
        perform_login(new_user)
      }.must_change 'User.count', 1

      must_redirect_to root_path
      must_respond_with :redirect
    end
  end
end
