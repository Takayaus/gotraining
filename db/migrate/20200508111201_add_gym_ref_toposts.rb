class AddGymRefToposts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :gym, foreign_key: true
  end
end
