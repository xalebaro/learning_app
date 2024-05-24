json.extract! lesson, :id, :content, :course_module_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
