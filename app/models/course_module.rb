class CourseModule < ApplicationRecord
  has_many :lessons, dependent: :destroy

  def progress(user)
    "#{completion(user).lessons_completed}/#{lessons.count}" if completion(user)
  end

  def enroll(user)
    CourseModuleCompletion.enroll_user(user, self)
  end

  def user_enrolled?(user)
    !CourseModuleCompletion.where(course_module: self, user: user).empty?
  end

  def completion(user)
    user.course_module_completions.where(course_module: self).first
  end

  def completed?(user)
    completion(user)&.completed
  end
end
