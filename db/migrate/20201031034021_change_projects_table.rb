class ChangeProjectsTable < ActiveRecord::Migration[5.2]
  def change
    change_table :projects do |t|
      t.remove :complete
      t.integer :user_id
    end
    add_column :posts, :user_id, :integer
    add_foreign_key :posts, :users
    add_foreign_key :projects, :users
  end
end
