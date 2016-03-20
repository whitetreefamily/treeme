class CreateComments < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :categories, :user_id, :integer
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
