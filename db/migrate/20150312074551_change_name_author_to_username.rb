class ChangeNameAuthorToUsername < ActiveRecord::Migration
  def change
  	rename_column :comments, :name_author, :username
  end
end
