class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :stars, null: false
      t.integer :submitter_id, null: false
      t.text :reason
      
      t.timestamps null: false
    end
  end
end
