class CreateTrainers < ActiveRecord::Migration[5.1]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
