class LessonCompletion < ApplicationRecord
  belongs_to :course_module_completion
  belongs_to :lesson
  after_save :verify_course_completion

  def complete
    self.completed_at = Time.zone.now
    self.completed = true
    save
  end

  def verify_course_completion
    course_module_completion.complete if course_module_completion.lesson_completions.all?(&:completed)
  end
end
