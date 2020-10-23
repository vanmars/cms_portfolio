class AddForeignKeyForProjects < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :projects, :users
  end
end
