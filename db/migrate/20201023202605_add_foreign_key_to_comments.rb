class AddForeignKeyToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :post_id, :integer
    add_foreign_key :comments, :posts
  end
end
