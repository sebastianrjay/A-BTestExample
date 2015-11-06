class DropGmailOauths < ActiveRecord::Migration
  def change
    drop_table :gmail_oauths
    add_column(:users, :gmail_refresh_token, :string, null: false)
  end
end
