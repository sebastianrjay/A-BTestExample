class SignupsController < ApplicationController

  def create
    if @signup = Signup.create(
        invited_user_cookie: cookies[:invited_user_cookie],
        referring_gmail_address: params[:referring_gmail_address],
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        linkedin_url: params[:linkedin_url]
      )
    else
      flash[:errors] = @signup.errors.full_messages
      redirect_to(url_for(controller: :invites, action: :show,
        id: params[:referring_gmail_address]))
    end
  end
end
