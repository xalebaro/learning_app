class Lesson < ApplicationRecord
  belongs_to :course_module
  belongs_to :prerequisite, class_name: "Lesson", optional: true

  def completed_by_user(user)
    course_module.completion(user)&.lesson_completions&.where(lesson: self)&.first&.completed
  end

  def complete(user)
    course_module.completion(user).lesson_completions.where(lesson: self).first.complete
  end

  def next_lesson
    Lesson.where(prerequisite: self).first
  end
end
