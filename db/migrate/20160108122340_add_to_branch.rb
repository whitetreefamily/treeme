class AddToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :check, :boolean, :default => false
  end
end
