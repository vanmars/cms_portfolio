class AddColumnForComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_id, :integer
    add_foreign_key :comments, :users
  end
end
