require 'rubygems'
require 'sinatra'
require 'sinatra/flash'
require 'json'

enable :sessions

set :scope_options, JSON.parse(File.read('data/scopes.json'))

get "/" do
  erb :index
end

get "/gettoken" do
  @display_scopes = settings.scope_options
  erb :token
end

post '/auth' do

  unless params[:selected_scopes]
    flash[:error] = "You need to select a scope"
    redirect '/gettoken'
  end

  requested_scopes = params[:selected_scopes].join('%20')

  url = "https://mixer.com/oauth/authorize"
  url += "?response_type=token"
  url += "&redirect_uri=#{request.base_url}/callback"
  url += "&scope=#{requested_scopes}"
  url += "&client_id=#{ENV['CLIENT_ID']}"

  redirect url

end

get '/callback' do
  erb :callback
end
