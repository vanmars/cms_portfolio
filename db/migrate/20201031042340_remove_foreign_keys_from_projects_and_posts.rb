class RemoveForeignKeysFromProjectsAndPosts < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :posts, column: :user_id
    remove_foreign_key :projects, column: :user_id
    remove_column :posts, :user_id
    remove_column :projects, :user_id
  end
end
