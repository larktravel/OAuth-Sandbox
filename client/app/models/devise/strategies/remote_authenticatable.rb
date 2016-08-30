module Devise
  module Strategies
    class RemoteAuthenticatable < Authenticatable
      #
      # For an example check : https://github.com/plataformatec/devise/blob/master/lib/devise/strategies/database_authenticatable.rb
      #
      # Method called by warden to authenticate a resource.
      #
      def authenticate!
        #
        # authentication_hash doesn't include the password
        #
        auth_params = authentication_hash
        auth_params[:password] = password

        #
        # mapping.to is a wrapper over the resource model
        #
        resource = mapping.to.new

        return fail! unless resource

        if validate(resource){ resource.remote_authentication(auth_params) }
          success!(resource)
        end
      end
    end
  end
end