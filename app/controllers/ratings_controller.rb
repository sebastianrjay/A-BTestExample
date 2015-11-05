class RatingsController < ApplicationController
  def new
    cookies[:hello] = "hello"
    puts "Hello:\n" + cookies[:hello]
    puts "Current user:"
    p current_user

    if current_user
      puts "Rendering ratings#new"
      render :new
    else
      redirect_to new_session_url
    end
  end
end
