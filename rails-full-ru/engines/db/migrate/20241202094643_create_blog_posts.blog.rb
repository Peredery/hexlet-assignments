# This migration comes from blog (originally 20241202094400)
class CreateBlogPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_posts do |t|
      t.string :name
      t.string :body

      t.timestamps
    end
  end
end
