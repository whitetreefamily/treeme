class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.integer :user_id
      t.integer :page_id

      t.timestamps null: false
    end
  end
end
