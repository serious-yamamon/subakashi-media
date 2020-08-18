class CreateWriters < ActiveRecord::Migration[5.2]
  def change
    create_table :writers do |t|
      t.string :code
      t.string :pass
      t.string :status
      t.string :name
      t.string :image
      t.string :twitter
      t.string :instagram
      t.string :youtube
      t.text :about
      t.text :description
      t.timestamps
    end
  end
end
