class RatingsController < ApplicationController
  def new
    if current_user
      render :new
    else
      redirect_to new_session_url
    end
  end

  def create
    Rating.create(
      stars: params[:rating].to_i,
      reason: params[:reason],
      submitter_gmail_address: params[:gmail_address]
    )

    render nothing: true
  end
end
