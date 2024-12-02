class CreateBlogPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :blog_posts do |t|
      t.string :name
      t.string :body

      t.timestamps
    end
  end
end