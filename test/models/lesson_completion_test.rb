require "test_helper"

class LessonCompletionTest < ActiveSupport::TestCase
  setup do
    @lesson_completion = lesson_completions(:one)
  end

  test "should get completed" do
    @lesson_completion.complete
    assert_not @lesson_completion.completed_at.nil?
  end

  test "should return completed status" do
    assert @lesson_completion.completed
  end
end
