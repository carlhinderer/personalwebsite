class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.belongs_to :post
      t.string :author
      t.string :author_website
      t.text :body
      t.datetime :posted
      t.timestamps
      t.index :post_id
    end
  end

  def down
    drop_table :comments
  end
end
