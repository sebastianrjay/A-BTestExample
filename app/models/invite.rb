class Invite < ActiveRecord::Base

  def signup
    Signup.find_by_invited_user_cookie(self.invited_user_cookie)
  end
end
