class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :info
      t.string :author
      t.string :webpage
      
      t.timestamps
    end
  end
end
