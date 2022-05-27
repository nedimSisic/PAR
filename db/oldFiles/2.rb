20220523194955_add_password_column_to_users.rb

class AddPasswordColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string
  end
end
