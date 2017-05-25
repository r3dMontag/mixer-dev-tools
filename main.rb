require 'rubygems'
require 'sinatra'
require 'json'

set :scope_options, JSON.parse(File.read('data/scopes.json'))

before do
  @display_scopes = settings.scope_options
end

get "/" do
  erb :index
  # @display_scopes.to_s
end

post '/auth' do
  url = "https://beam.pro/oauth/authorize"
  url += "?response_type=token"
  url += "&redirect_uri=#{request.base_url}/callback"
  url += "&scope=chat:connect%20chat:chat"
  url += "&client_id=#{ENV['CLIENT_ID']}"

  redirect url
end

get '/callback' do
  erb "thank you"
end
