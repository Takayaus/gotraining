class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :content
      t.date :post

      t.timestamps
    end
  end
end
