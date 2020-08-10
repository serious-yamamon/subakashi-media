class RemoveDefaultRestrictFromPosts < ActiveRecord::Migration[5.2]
  def change
    change_column_default :posts, :slug, from: "None", to: nil
    change_column_default :posts, :description, from: "No Description", to: nil
  end
end
