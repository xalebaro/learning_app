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
  Lesson.create(title: "Jazz Scale #{index}", course_module: CourseModule.first, content: "Jazz is a music genre that originated in the African-American communities of New Orleans, Louisiana, in the late 19th and early 20th centuries, with its roots in blues, ragtime, European harmony and African rhythmic rituals.[1][2][3][4][5][6] Since the 1920s Jazz Age, it has been recognized as a major form of musical expression in traditional and popular music. Jazz is characterized by swing and blue notes, complex chords, call and response vocals, polyrhythms and improvisation.", prerequisite: prerequisite)
end

10.times do |index|
  prerequisite = if CourseModule.second.lessons.count == 0
    nil
  else
    Lesson.last
  end
  Lesson.create(title: "Jazz Chord # #{index}", course_module: CourseModule.second, content: "Jazz is a music genre that originated in the African-American communities of New Orleans, Louisiana, in the late 19th and early 20th centuries, with its roots in blues, ragtime, European harmony and African rhythmic rituals.[1][2][3][4][5][6] Since the 1920s Jazz Age, it has been recognized as a major form of musical expression in traditional and popular music. Jazz is characterized by swing and blue notes, complex chords, call and response vocals, polyrhythms and improvisation.", prerequisite: prerequisite)
end
