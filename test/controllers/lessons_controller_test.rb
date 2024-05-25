require "test_helper"

class LessonsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users :one
    @lesson = lessons(:one)
  end

  test "should get index" do
    get lessons_url
    assert_response :success
  end

  test "should show lesson" do
    get lesson_url(@lesson)
    assert_response :success
  end

  test "should complete a lesson and redirect" do
    get lesson_complete_lesson_url(@lesson)
    assert_response :redirect
  end
end
