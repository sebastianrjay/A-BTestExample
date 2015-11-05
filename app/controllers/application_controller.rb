class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    access_token = cookies[:access_token]
    expiration = cookies[:expires_at].to_i

    if access_token && expiration && expiration < Time.now.to_i
      return User.find_by_access_token(access_token)
    end

    nil
  end
end
