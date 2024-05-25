class LessonCompletion < ApplicationRecord
  belongs_to :course_module_completion
  belongs_to :lesson

  def complete
    self.completed_at = Time.zone.now
    save
  end

  def completed
    !completed_at.nil?
  end
end
