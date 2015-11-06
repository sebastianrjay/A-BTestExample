class User < ActiveRecord::Base

  def ratings
    Rating.where("submitter_gmail_address = ?", self.gmail_address)
  end
end
