module Devise
  module Models
    module RemoteAuthenticatable
      extend ActiveSupport::Concern

      #
      # Here you do the request to the external webservice
      #
      # If the authentication is successful you should return
      # a resource instance
      #
      # If the authentication fails you should return false
      #
      def remote_authentication(authentication_hash)
        params = {
          'username' => authentication_hash[:email],
          'password' => authentication_hash[:password],
          'client_id' => 'myclient',
          'grant_type' => 'password'
        }
        byebug
        puts "doing stuffs heres"
=begin
        result = AuthClient.get_oauth_token(params)
        return false unless result.success?
        response = JSON.parse(result.response)
        self.email = authentication_hash[:email]
        self.auth_token = response['access_token']
        self.refresh_token = response['refresh_token']
        self.expires_at = Time.now + response['expires_in']
=end
        return self
      end

      module ClassMethods
        def serialize_from_session(data, salt)
          resource = self.new
          resource.email = data['email']
          resource.auth_token = data['auth_token']
          resource.refresh_token = data['refresh_token']
          resource.expires_at = data['expires_at']
          resource
        end

        def serialize_into_session(record)
          [
            {
              :email => record.email,
              :auth_token => record.auth_token,
              :refresh_token => record.refresh_token,
              :expires_at => record.expires_at
            },
            nil
          ]
        end
      end
    end
  end
end
