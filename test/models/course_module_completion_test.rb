require "test_helper"

class CourseModuleCompletionTest < ActiveSupport::TestCase
  setup do
    @lesson_completion = lesson_completions(:one)
    @course_module_completion = @lesson_completion.course_module_completion
    @course_module = @course_module_completion.course_module
    @user = @course_module_completion.user
    @course_module_completion2 = course_module_completions(:two)
    @course_module2 = course_modules(:two)
  end

  test "should return lessons completed" do
    assert_equal(@course_module_completion.lessons_completed, 1)
  end

  test "should enroll user into course module" do
    CourseModuleCompletion.enroll_user(@user, @course_module2)
    assert_equal(@course_module2.user_enrolled?(@user), true)
  end

  test "should return completion status" do
    assert_equal(@course_module_completion.completed, true)
  end
end
