class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.integer :post_id
      t.text :content
      t.string :image
      t.integer :user_id
      t.timestamps
    end
  end
end
