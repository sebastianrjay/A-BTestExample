class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    access_token = cookies[:access_token]
    expiration = cookes[:expires_at]

    if access_token && expiration && expiration < Time.now.to_i
      User.find_by_access_token(access_token)
    else
      nil
    end
  end
end
