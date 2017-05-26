require 'rubygems'
require 'sinatra'
require 'json'

set :scope_options, JSON.parse(File.read('data/scopes.json'))

get "/" do
  erb :index
  # @display_scopes.to_s
end

get "/gettoken" do
  @display_scopes = settings.scope_options
  erb :'token'
end

post '/auth' do
  requested_scopes = params[:selected_scopes].join('%20')

  url = "https://mixer.com/oauth/authorize"
  url += "?response_type=token"
  url += "&redirect_uri=#{request.base_url}/callback"
  url += "&scope=#{requested_scopes}"
  url += "&client_id=#{ENV['CLIENT_ID']}"

  redirect url

end

get '/callback' do
  erb :'callback', { :layout => :'layout'}
end
#1B1E2C
#002773
#73788A
#D8D8DB
