class RenameUserAccessToken < ActiveRecord::Migration
  def change
    rename_column(:users, :access_token, :gmail_token)
  end
end
