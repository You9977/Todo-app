class AddCheckboxToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :checkbox, :boolean
  end
end