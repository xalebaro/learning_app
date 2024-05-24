class RemovePrerequisiteIndexLessons < ActiveRecord::Migration[7.1]
  def up
    change_column :lessons, :prerequisite_id, :integer, null: true
  end

  def down
    change_column :lessons, :prerequisite_id, :integer, null: false
  end
end
