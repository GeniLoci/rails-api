class RenameTable < ActiveRecord::Migration
  def change
    rename_table :assets, :entities
  end
end
