class RemoveCompletedFieldsFromCourseModuleCompletion < ActiveRecord::Migration[7.1]
  def change
    remove_column :course_module_completions, :completed, :boolean
    remove_column :course_module_completions, :completed_at, :timestamp
    remove_column :lesson_completions, :completed, :boolean
  end
end
