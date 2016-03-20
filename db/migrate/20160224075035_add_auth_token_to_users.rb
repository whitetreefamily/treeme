class AddAuthTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_sent_at, :datetime
    add_column :users, :auth_token, :string
    add_column :pages, :body, :text
  end
end
