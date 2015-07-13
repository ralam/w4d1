require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.html'
).to_s

#puts RestClient.get(url)

def edit_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3.json'
  ).to_s

  puts RestClient.patch(
    url,
    { user: { name: "Gadget", email: "gadget@cats.io"} }
  )
end

edit_user
