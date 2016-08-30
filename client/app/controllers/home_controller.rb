class HomeController < ApplicationController

  def user_logged_in
    unless user_signed_in?
      redirect_to :index
    end
  end

end
