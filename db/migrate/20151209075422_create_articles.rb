class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :category_id
      t.integer :page_id
      t.string :image

      t.timestamps null: false
    end
  end
end
