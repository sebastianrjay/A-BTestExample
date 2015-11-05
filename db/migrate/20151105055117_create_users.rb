class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :gmail_address, null: false
      t.string :first_name
      t.string :last_name
      t.string :access_token, null: false

      t.timestamps null: false
    end
  end
end
