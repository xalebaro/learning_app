class CourseModuleCompletion < ApplicationRecord
  belongs_to :user
  belongs_to :course_module
  has_many :lesson_completions, dependent: :destroy

  def lessons_completed
    lesson_completions.where(completed: true).count
  end

  def self.enroll_user(user, course_module)
    completion = CourseModuleCompletion.create(user: user, course_module: course_module)
    course_module.lessons.each do |lesson|
      completion.lesson_completions.create!(lesson: lesson)
    end
  end

  def complete
    self.completed_at = Time.zone.now
    self.completed = true
    save
  end
end
