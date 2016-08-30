require 'bundler'
Bundler.require

require 'oauth2'
callback = "urn:ietf:wg:oauth:2.0:oob"
app_id = "a7182a7390490799be6012d0b1ea8309000f836e2e90083eede45d5e449b860c"
secret = "bf5a006a14961dca24f364ce38a8b91dd344fb413a259a2432fcf5afe051f12b"
client = OAuth2::Client.new(app_id, secret, site: "http://localhost:7777/")
auth_url = client.auth_code.authorize_url(:redirect_uri => callback)
token = client.password.get_token('koushik@larktravel.com', 'password')
puts "token received is #{token.token}"

=begin
client = OAuth2::Client.new(app_id, secret, site: "http://localhost:7777/")
client.auth_code.authorize_url(redirect_uri: callback)

access = client.auth_code.get_token('b77df49142317a6a42ea12412d2065c949c9e01ca3c9d72a478f34f153a88678', redirect_uri: callback)
access.get("/api/tasks").parsed
access.post("/api/tasks", params: {task: {name: "test oauth"}})
access.get("/api/user").parsed
=end
