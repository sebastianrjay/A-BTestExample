class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    gmail_token, expiration = cookies[:gmail_token], cookies[:expires_at].to_i

    if gmail_token && expiration && expiration > Time.now.to_i
      return @current_user ||= User.find_by_gmail_token(gmail_token)
    end

    nil
  end
end
