class DropNonexistentGmailRefreshToken < ActiveRecord::Migration
  def change
    remove_column(:users, :gmail_refresh_token)
  end
end
