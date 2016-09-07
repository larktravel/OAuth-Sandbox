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

        app_id = "a7182a7390490799be6012d0b1ea8309000f836e2e90083eede45d5e449b860c"
        secret = "bf5a006a14961dca24f364ce38a8b91dd344fb413a259a2432fcf5afe051f12b"

        begin
          client = OAuth2::Client.new(app_id, secret, site: "http://localhost:7777/")
          self.access_token = client.password.get_token(params["username"], params["password"])
          #response = auth_token.get('/dummy_data')
          self.auth_token = access_token.token
          self.refresh_token = access_token.refresh_token
          self.expires_at = Time.now + access_token.expires_in
        rescue OAuth2::Error => e
          puts e
          self.access_token = nil
          self.auth_token = nil
          self.refresh_token = nil
          self.expires_at = nil
        end

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
