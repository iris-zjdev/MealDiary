class CreateMealPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :meal_posts do |t|
      t.string :title
      t.text :content
      t.integer :meal_type
      t.integer :meal_source
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
