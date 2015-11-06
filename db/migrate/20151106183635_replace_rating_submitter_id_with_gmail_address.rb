class ReplaceRatingSubmitterIdWithGmailAddress < ActiveRecord::Migration
  def change
    remove_column(:ratings, :submitter_id)
    add_column(:ratings, :submitter_gmail_address, :string, null: false)
  end
end
