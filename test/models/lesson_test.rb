require "test_helper"

class LessonTest < ActiveSupport::TestCase
  setup do
    @lesson_completion = lesson_completions(:one)
    @lesson = @lesson_completion.lesson
    @user = @lesson_completion.course_module_completion.user
    @lesson2 = lessons(:two)
  end

  test "should check if lesson is completed by user" do
    assert(@lesson.completed_by_user(@user))
  end

  test "should complete lesson for user" do
    @lesson.complete(@user)
    assert(@lesson_completion.completed)
  end

  test "should return next lesson" do
    assert_equal(@lesson.next_lesson, @lesson2)
  end
end
