require 'test_helper'

class HomesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get aboutus" do
    get :aboutus
    assert_response :success
  end

  test "should get notce" do
    get :notce
    assert_response :success
  end

  test "should get rule" do
    get :rule
    assert_response :success
  end

  test "should get mypage" do
    get :mypage
    assert_response :success
  end

end
