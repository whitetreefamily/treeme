class CreateCategoriesUsers < ActiveRecord::Migration
  def change
    create_table :categories_users,:id => false do |t|

    t.references :user
      t.references :category

      def self.down
        drop_table :categories_users
      end

    end
  end
end
