class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name
      t.timestamps
      t.index :name
    end
  end

  def down
    drop_table :categories
  end
end
