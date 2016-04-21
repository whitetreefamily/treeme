class CreateAdmins < ActiveRecord::Migration
  def change
    add_column :users, :change, :boolean, :default => false
    create_table :admins do |t|
      t.boolean :check , default: false
      t.integer :user_id
      t.string :username
      t.string :password
      t.string :password_hash
      t.string :users, :password_salt
      t.string  :position
      t.boolean :change, :default => false
      t.timestamps null: false
    end
  end
end
