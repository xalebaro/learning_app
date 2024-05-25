class AddTitleToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :title, :string
  end
end
