class Lesson < ApplicationRecord
  belongs_to :course_module
  belongs_to :prerequisite, class_name: "Lesson", optional: true
end
