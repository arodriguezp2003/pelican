class CreateEditorials < ActiveRecord::Migration
  def change
    create_table :editorials do |t|
      t.string :name, null: false
      t.timestamps
    end
    
  end
end
