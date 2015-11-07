class InvitesController < ApplicationController

  def show
    @referring_user = User
      .find_by_gmail_address(Base64.urlsafe_decode64(params[:id])) rescue nil

    cookies[:invited_user_cookie] ||= SecureRandom.urlsafe_base64

    # Save a new invite to the DB if the user has not logged in before, and
    # either has not opened this invite page before, or has been referred by an
    # additional user. Notice that we save a unique invite for each user who
    # sends the invite link to the same person. If I'm invited by Bob and Sally,
    # I've received two invites. I could change the app so that it only saves
    # one invite per invited user; I somewhat arbitrarily chose this strategy.
    if @referring_user && !cookies[:gmail_token] &&
        !(cookies[:referring_users] || []).include?(@referring_user.gmail_address)
      cookies[:referring_users] ||= []
      cookies[:referring_users] << @referring_user.gmail_address
      Invite.create(
        creator_gmail_address: @referring_user.gmail_address,
        invited_user_cookie: cookies[:invited_user_cookie]
      )
    elsif @referring_user
      render :show
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
