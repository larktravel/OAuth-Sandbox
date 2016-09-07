class Users::SessionsController < Devise::SessionsController
  skip_before_action :require_no_authentication, raise: false
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    puts "starting signin call"
    self.resource = warden.authenticate!(auth_options)
    if current_user.access_token.nil?
      puts "login failed going to users/sign_in"
      sign_out
      redirect_to new_user_session_path
    else
      puts "login successful going to user_logged_in_path"
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)

      session[:user_id] = current_user.id
      session[:access_token] = current_user.access_token.to_hash
      redirect_to(user_logged_in_path)
    end
  end

  # DELETE /resource/sign_out
  def destroy
    app_id = "a7182a7390490799be6012d0b1ea8309000f836e2e90083eede45d5e449b860c"
    secret = "bf5a006a14961dca24f364ce38a8b91dd344fb413a259a2432fcf5afe051f12b"

    client = OAuth2::Client.new(app_id, secret, site: "http://localhost:7777/")
    puts "session destroy #{session[:access_token]}"
    access_token = OAuth2::AccessToken.from_hash(client, session[:access_token])
    access_token.delete("/users/sign_out")
    session[:user_id] = nil
    session[:access_token] = nil
    sign_out current_user
    super

  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
