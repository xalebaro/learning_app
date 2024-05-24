class CreateCourseModuleCompletions < ActiveRecord::Migration[7.1]
  def change
    create_table :course_module_completions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course_module, null: false, foreign_key: true
      t.boolean :completed, null: false, default: false
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
