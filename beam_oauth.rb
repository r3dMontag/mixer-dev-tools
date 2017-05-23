require 'net/http'
require 'net/https'
require 'json'
require 'optparse'

# "Usage: ./beam_oauth client_id client_secret scope"

p ARGV

if ARGV.length != 1
  puts "Usage: ./beam_oauth client_id client_secret scope"
  abort
end

# Beam Shortcode Post (POST )
def send_shortcode_request
  uri = URI('https://beam.pro/api/v1/oauth/shortcode')

  # Create client
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  data = {
            "client_id" => "80c6a2bd0b6a3e077be3fb9d4d03e3a021ddf3e274c1cd23",
            "client_secret" => "d73b9d44f60713e957c7bff24533939fd3431739953382d8b5a83ff92c5a695f",
            "scope" => "user:details:self"
        }
  body = JSON.dump(data)

  # Create Request
  req =  Net::HTTP::Post.new(uri)
  # Add headers
  req.add_field "Cookie", "__bcsrf=f3fb15d6ec601ad1247aebe045cf197a47b5c757"
  # Add headers
  req.add_field "Content-Type", "application/json; charset=utf-8"
  # Set body
  req.body = body

  # Fetch Request
  res = http.request(req)
  puts "Response HTTP Status Code: #{res.code}"
  puts "Response HTTP Response Body: #{res.body}"
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"
end
