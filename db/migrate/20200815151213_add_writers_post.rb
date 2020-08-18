class AddWritersPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :writer, foreign_key: true, null: false, default: 1
    add_reference :posts, :series, foreign_key: true
  end
end
