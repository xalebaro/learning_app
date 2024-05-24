class AddSelfReferenceToLesson < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :prerequisite_id, :integer, null: true
    add_index :lessons, :prerequisite_id
    add_foreign_key :lessons, :lessons, column: :prerequisite_id
  end
end
