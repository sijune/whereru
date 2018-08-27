require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get sent" do
    get :sent
    assert_response :success
  end

  test "should get recieve" do
    get :recieve
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
