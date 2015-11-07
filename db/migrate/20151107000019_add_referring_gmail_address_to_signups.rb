class AddReferringGmailAddressToSignups < ActiveRecord::Migration
  def change
    add_column(:signups, :referring_gmail_address, :string)
  end
end
