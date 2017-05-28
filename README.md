## Prerequisites
* This project runs on ruby 2.4.0. Use `ruby --version` to check which version you are running.
	* Use rvm to install/use 2.4.0 : [Install RVM](https://rvm.io/rvm/install).
	* run `rvm install 2.4.0` , `rvm use 2.4.0`  
* Install bundler and foreman: `gem install bundler foreman`

## Getting Started
1. Clone or download the repo.
1. run `bundle install`
1. If using foreman:
	* Create .env (See the .env template) with specified ENVIRONMENT variables
	* foreman's default port is 5000, you can change it in the .env file
1. To run the app:
	* If using foreman: `foreman start`
	* Otherwise: `CLIENT_ID=(yourclientidfromyouroauthappinmixerlabs) PORT=(defaultportis4567) ruby main.rb`

## Notes
* [data.json](data/scopes.json) contains the latest set of scopes from [Mixer's OAuth Documentation](https://dev.mixer.com/reference/oauth/) that have been tested and are known to be valid permission scopes.
* The OAuth token generation uses the [implicit grant](https://tools.ietf.org/html/rfc6749#section-1.3.2) flow and is only ever sent to the client, not the server. These tokens expire after one year. See [Mixer's OAuth Documentation](https://dev.mixer.com/reference/oauth/) for more details.
* Neither this tool or myself are associated with [Mixer](http://mixer.com) (formerly Beam).
