class CreateVotePages < ActiveRecord::Migration
  def change
    add_column :users, :sex, :string
    add_column :users, :admin, :boolean, :default => false
    add_column :contestants, :vote_page_id, :integer
    add_column :contestant_votes, :vote_page_id, :integer
    create_table :vote_pages do |t|
      t.string :name
      t.integer :user_id
      t.integer :make_id
      t.timestamps null: false
    end
  end
end
