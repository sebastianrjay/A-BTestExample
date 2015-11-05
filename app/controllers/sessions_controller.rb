class SessionsController < ApplicationController
  layout false

  def new; end

  def create
    omniauth_info = request.env['omniauth.auth']['info']
    credentials = request.env['omniauth.auth']['credentials']
    previous_token = cookies[:access_token]

    if previous_token && (user = User.find_by_access_token(previous_token))
      user.update_attributes(
        access_token: credentials['token']
      )
    else
      User.create(
        gmail_address: omniauth_info['email'],
        first_name: omniauth_info['first_name'],
        last_name: omniauth_info['last_name'],
        access_token: credentials['token']
      )
    end

    cookies[:access_token] = credentials['token']
    cookies[:expires_at] = credentials['expires_at']

    redirect_to root_url
  end
end
