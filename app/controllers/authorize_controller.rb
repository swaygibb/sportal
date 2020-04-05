require 'cgi'

class AuthorizeController < ApplicationController

    # GET /authorize
    def index
        redirect_url = CGI.escape("#{ENV['LOCAL_REDIRECT_PATH']}")
        spotify_url = "#{ENV['SPOTIFY_AUTHORIZE_URL']}?client_id=#{ENV['SPOTIFY_CLIENT_ID']}&response_type=code&redirect_uri=#{redirect_url}&scope=#{CGI.escape(ENV['SPOTIFY_SCOPE'])}"

        redirect_to spotify_url
    end
end
