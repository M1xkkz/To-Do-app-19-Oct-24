class AddCategoryIdToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :category_id, :integer
  end
end
