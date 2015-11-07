class InvitesController < ApplicationController

  def show
    # Change template firstName to @referring_user.first_name, gmailAddress
    # to @referring_user.gmail_address
    @referring_user = User
      .find_by_gmail_address(Base64.urlsafe_decode64(params[:id])) rescue nil

    cookies[:invited_user_cookie] ||= SecureRandom.urlsafe_base64

    # Save a new invite if the user has not logged in before, and has not opened
    # this invite page before
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
