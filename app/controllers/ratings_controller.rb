class RatingsController < ApplicationController
  def new
    cookies[:hello] = "hello"
    puts "Hello:\n" + cookies[:hello]

    if current_user
      render :new
    else
      redirect_to new_session_url
    end

    render :new
  end
end
