class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :author_id, :integer
    add_column :comments, :article_id, :integer
  end
end
