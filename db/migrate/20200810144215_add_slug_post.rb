class AddSlugPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :slug, :string, null: false, default: "None"
    add_index :posts, :slug, unique: true

  end
end
