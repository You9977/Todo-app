class AddContentToTasksContent < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :content, :text
  end
end
