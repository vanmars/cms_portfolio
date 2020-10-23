class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.timestamps
    end

    create_table :comments do |t|
      t.string :body
      t.timestamps
    end
  end
end
