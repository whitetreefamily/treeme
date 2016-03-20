class AddToPage < ActiveRecord::Migration
  def change
    add_column :pages, :views, :integer
    add_column :articles, :views, :integer
  end
end
