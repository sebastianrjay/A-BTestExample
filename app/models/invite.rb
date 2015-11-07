class Invite < ActiveRecord::Base

  def creator
    User.find_by_gmail_address(self.creator_gmail_address)
  end

  def signup
    Signup.find_by_invited_user_cookie(self.invited_user_cookie)
  end
end
