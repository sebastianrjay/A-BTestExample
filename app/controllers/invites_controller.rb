class InvitesController < ApplicationController

  def show
    # Change template firstName to @referring_user.first_name, gmailAddress
    # to @referring_user.gmail_address
    @referring_user = User.find_by_gmail_address(URLcrypt.decrypt(params[:id]))
    cookies[:invited_user_cookie] ||= SecureRandom.urlsafe_base64

    unless (cookies[:referring_users] || []).include?(@referring_user.gmail_address)
      cookies[:referring_users] ||= []
      cookies[:referring_users] << @referring_user.gmail_address
      Invite.create(
        creator_gmail_address: @referring_user.gmail_address,
        invited_user_cookie: cookies[:invited_user_cookie]
      )
    end
  end
end
