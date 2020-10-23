class RemoveForeignKeyFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :projects, column: :user_id
    remove_column :projects, :user_id
  end
end
