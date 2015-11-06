class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :invited_user_cookie, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :linkedin_url

      t.timestamps null: false
    end
  end
end
