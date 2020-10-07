class CreatePostAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :post_announcements do |t|
      t.string :title
      t.text :content
      t.datetime :post

      t.timestamps
    end
  end
end
