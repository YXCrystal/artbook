class CreateLikePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :like_posts do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
