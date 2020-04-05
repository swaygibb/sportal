class AlbumController < ApplicationController
    
    # GET /userinfo
    def index
        $spotify_token = SpotifyAuthorizationService.new.authorize(session)
        if $spotify_token.length > 0
            response = AlbumService.new.get(session)
            render json: response.read_body
        else
            session[:last_url] = 'album'
            redirect_to "/authorize"
        end
    end
end
