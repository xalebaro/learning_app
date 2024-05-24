# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
["Jazz Scales", "Harmony"].each do |course_module_title|
  CourseModule.find_or_create_by!(title: course_module_title)
end

10.times do |index|
  prerequisite = if CourseModule.first.lessons.count == 0
    nil
  else
    Lesson.last
  end
  Lesson.create(course_module: CourseModule.first, content: "Jazz Scale # #{index}", prerequisite: prerequisite)
end

10.times do |index|
  prerequisite = if CourseModule.second.lessons.count == 0
    nil
  else
    Lesson.last
  end
  Lesson.create(course_module: CourseModule.second, content: "Jazz Chord # #{index}", prerequisite: prerequisite)
end
