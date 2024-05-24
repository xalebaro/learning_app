class CreateLessonCompletions < ActiveRecord::Migration[7.1]
  def change
    create_table :lesson_completions do |t|
      t.references :course_module_completion, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.boolean :completed, default: false, null: false
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
