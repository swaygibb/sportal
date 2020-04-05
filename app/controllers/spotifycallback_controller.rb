require 'cgi'

class SpotifycallbackController < ApplicationController

    # GET /authorize
    def index
        $spotify_code = params[:code]
        session[:spotify_code] = $spotify_code
        Rails.logger.debug $spotify_code
        redirect_to "/userinfo"
    end
end
