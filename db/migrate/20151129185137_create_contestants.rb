class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.integer :user_id
      t.string :image
      t.string :name
      t.string :title

      t.timestamps null: false
    end
  end
end
