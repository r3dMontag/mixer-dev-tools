## Prerequisites
* This project runs on ruby 2.4.0. Use `ruby --version` to check which version you are running.
	* Use rvm to install/use 2.4.0 : [Install RVM](https://rvm.io/rvm/install).
	* run `rvm install 2.4.0` , `rvm use 2.4.0` .
* Install bundler and foreman: `gem install bundler foreman`.

## Getting Started
1. Clone or download the repo.
1. run `bundle install`
1. Create .env: `cp env.template .env` with specified ENVIRONMENT variables.
1. Edit .env and replace 'your_client_id' with your OAuth Client ID from [Mixer](https://mixer.com/lab).
1. To run the app: `foreman start`.
1. Open [localhost:5000](http://localhost:5000).

## Notes
* [scopes.json](data/scopes.json) contains the latest set of scopes from [Mixer's OAuth Documentation](https://dev.mixer.com/reference/oauth/) that have been tested and are known to be valid permission scopes.
* The OAuth token generation uses the [implicit grant](https://tools.ietf.org/html/rfc6749#section-1.3.2) flow and is only ever sent to the client, not the server. These tokens expire after one year. See [Mixer's OAuth Documentation](https://dev.mixer.com/reference/oauth/) for more details.
* Neither this tool or myself are associated with [Mixer](http://mixer.com) (formerly Beam).
