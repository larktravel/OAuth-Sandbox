class HomeController < ApplicationController

  def dummy_data
    if doorkeeper_token
      output = "Your code is #{SecureRandom.urlsafe_base64}"
      render json: output
    end
  end
end
