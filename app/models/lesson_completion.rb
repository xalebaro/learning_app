class LessonCompletion < ApplicationRecord
  belongs_to :course_module
  belongs_to :lesson
end
