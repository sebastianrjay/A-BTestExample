class User < ActiveRecord::Base

  def submitted_ratings
    Rating.where("submitter_gmail_address = ?", self.gmail_address)
  end

  def created_invites
    Invite.where("creator_gmail_address = ?", self.gmail_address)
  end
end
