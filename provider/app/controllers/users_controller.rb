class UsersController < ApplicationController
  doorkeeper_for :all

  def show
    user = {
      id: 95,
      first_name: "Koushik",
      last_name: "Dasika"
    }
    render json: user.to_json
  end
end
