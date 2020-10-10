class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
