class User
  attr_accessor :id, :email, :auth_token, :refresh_token, :expires_at, :access_token
  include ActiveModel::Model

  include ActiveModel::Validations #required because some before_validations are defined in devise
  extend ActiveModel::Callbacks #required to define callbacks
  extend Devise::Models

  define_model_callbacks :validation #required by Devise

  devise :remote_authenticatable, :timeoutable, :registerable

  # Latest devise tries to initialize this class with values
  #   # ignore it for now
  def initialize(options={})
  end
end
