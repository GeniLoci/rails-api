class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
	t.references :entry  
    	t.timestamps null: false
    end
    add_attachment :assets, :file
  end
end
