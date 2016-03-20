class CreateContestantVotes < ActiveRecord::Migration
  def change
    create_table :contestant_votes do |t|
      t.integer :user_id
      t.integer :contestant_id
      t.integer :value

      t.timestamps null: false
    end
  end
end
