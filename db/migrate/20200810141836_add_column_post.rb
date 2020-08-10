class AddColumnPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :favorite, :boolean, default: false
    add_column :posts, :description, :string, null: false, default: "No Description"
  end
end
