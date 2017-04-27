require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get questions_add_url
    assert_response :success
  end

  test "should get index" do
    get questions_index_url
    assert_response :success
  end

  test "should get destroy" do
    get questions_destroy_url
    assert_response :success
  end

end
