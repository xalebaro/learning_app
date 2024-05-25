require "test_helper"

class CourseModuleTest < ActiveSupport::TestCase
  setup do
    @lesson_completion = lesson_completions(:one)
    @course_module_completion = @lesson_completion.course_module_completion
    @course_module = @course_module_completion.course_module
    @user = @course_module_completion.user
    @course_module2 = course_modules(:two)
  end

  test "should return progress of course module" do
    assert_equal(@course_module.progress(@user), "1/1")
  end

  test "should enroll user into course module" do
    @course_module2.enroll(@user)
    assert_equal(@course_module2.user_enrolled?(@user), true)
  end

  test "should return course module completion for user" do
    assert_equal(@course_module.completion(@user), @course_module_completion)
  end

  test "should return completion status for user" do
    assert_equal(@course_module.completed?(@user), true)
  end
end
