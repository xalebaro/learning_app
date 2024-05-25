require "test_helper"

class CourseModulesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users :one
    @course_module = course_modules(:one)
  end

  test "should get index" do
    get course_modules_url
    assert_response :success
  end

  test "should show course_module" do
    get course_module_url(@course_module)
    assert_response :success
  end

  test "should show enroll user to course_module" do
    get course_module_enroll_to_course_module_url(@course_module)
    assert_response :redirect
  end
end
