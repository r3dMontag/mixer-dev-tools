require 'rubygems'
require 'sinatra'

get "/" do
  erb :index
end

post '/auth' do
  url = "https://beam.pro/oauth/authorize"
  url += "?response_type=token"
  url += "&redirect_uri=http://localhost:4567/callback"
  url += "&scope=chat:connect%20chat:chat"
  url += "&client_id=#{ENV['CLIENT_ID']}"

  redirect url
end

get '/callback' do
  erb "thank you"
end
