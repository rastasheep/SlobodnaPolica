class AddLangToBooks < ActiveRecord::Migration
  def change
    add_column :books, :lang, :string
  end
end
