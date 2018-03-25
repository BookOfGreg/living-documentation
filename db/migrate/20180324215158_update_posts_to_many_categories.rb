class UpdatePostsToManyCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :category_id
    create_table :posts_categories do |t|
      t.integer :post_id
      t.integer :category_id

      t.timestamps
    end
    add_index :posts_categories, [:post_id, :category_id]
  end
end
