class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name_author
      t.text :comment

      t.timestamps null: false
    end
  end
end
