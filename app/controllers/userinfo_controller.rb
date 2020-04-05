class UserinfoController < ApplicationController
    
    # GET /userinfo
    def index
        $spotify_token = SpotifyAuthorizationService.new.authorize(session)
        if $spotify_token.length > 0
            response = UserinfoService.new.get(session)
            render json: response.read_body
        else
            redirect_to "/authorize"
        end
    end
end
