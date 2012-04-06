class AddCategoriesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :categories, :string
  end
end
