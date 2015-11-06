class Rating < ActiveRecord::Base

  def submitter
    User.find_by_gmail_address(self.submitter_gmail_address)
  end
end
