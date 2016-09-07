class HomeController < ApplicationController
  skip_before_action :require_no_authentication, raise: false
  before_action :authenticate_user!, :only => [:user_logged_in]

  def user_logged_in
    app_id = "a7182a7390490799be6012d0b1ea8309000f836e2e90083eede45d5e449b860c"
    secret = "bf5a006a14961dca24f364ce38a8b91dd344fb413a259a2432fcf5afe051f12b"

    client = OAuth2::Client.new(app_id, secret, site: "http://localhost:7777/")
    puts "user logged in access token #{session[:access_token]}"

    access_token = OAuth2::AccessToken.from_hash(client, session[:access_token])
    @code = access_token.get('/dummy_data').body
  end

end
