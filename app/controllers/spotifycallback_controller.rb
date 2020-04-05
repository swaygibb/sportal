require 'cgi'

class SpotifycallbackController < ApplicationController

    # GET /spotifycallback
    def index
        $spotify_code = params[:code]
        session[:spotify_code] = $spotify_code
        
        redirect_to "/#{session[:last_url]}"
    end
end
