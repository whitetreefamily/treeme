class CreateInfos < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    add_column :pages, :slug, :string
    add_index :pages, :slug
    create_table :infos do |t|
      t.integer :page_id
      t.string :name

      t.timestamps null: false
    end
  end
end
