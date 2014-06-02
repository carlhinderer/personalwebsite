class CreatePostsTags < ActiveRecord::Migration
  def up
    create_table :posts_tags, :id => false do |t|
      t.belongs_to :post, :null => false
      t.belongs_to :tag, :null => false
    end

    add_index(:posts_tags, [:post_id, :tag_id], :unique => true)
  end

  def down
    remove_index :posts_tags, [:post_id, :tag_id]
    drop_table :posts_tags
  end
end
