class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :password, :srting
  end
end
