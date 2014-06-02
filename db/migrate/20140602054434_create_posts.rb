class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.belongs_to :category
      t.string :title
      t.text :body
      t.date :posted
      t.timestamps
      t.index :title
    end
  end

  def down
    drop_table :posts
  end
end
