class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

=begin
  def after_sign_in_path_for(resource_or_scope)
     return user_logged_in_path
  end
=end
end
