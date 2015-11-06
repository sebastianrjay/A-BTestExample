class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :creator_gmail_address, null: false
      t.string :invited_user_cookie, null: false

      t.timestamps null: false
    end
  end
end
