class SessionsController < ApplicationController
  layout false

  def new; end

  def create
    omniauth_info = request.env['omniauth.auth']['info']
    credentials = request.env['omniauth.auth']['credentials']
    user = User.find_by_gmail_address(omniauth_info['email'])

    if user
      user.update(access_token: credentials['token'])
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

    puts "Access token:"
    puts cookies[:access_token]
    puts "Expires at:"
    puts cookies[:expires_at].to_s

    redirect_to root_url
  end
end
