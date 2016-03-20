class CreatePages < ActiveRecord::Migration
  def change
    add_column :vote_pages, :page_id, :integer
    create_table :pages do |t|
      t.string :name
      t.integer :page_no
      t.integer :user_id
      t.string :image

      t.timestamps null: false
    end
  end
end
