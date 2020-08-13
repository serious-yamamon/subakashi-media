class DropTableCatagories < ActiveRecord::Migration[5.2]
  def change
    drop_table :catagories
  end
end
