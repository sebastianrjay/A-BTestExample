class Signup < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :email, :invited_user_cookie, uniqueness: true

  def invite
    Invite.find_by_invited_user_cookie(self.invited_user_cookie)
  end
end
