class AlbumController < ApplicationController
    
    # GET /userinfo
    def index
        $spotify_token = SpotifyAuthorizationService.new.authorize(session)
        if $spotify_token.length > 0
            albumList = AlbumService.new.get(session)
            render json: albumList
        else
            session[:last_url] = "album"
            redirect_to "/authorize"
        end
    end
end
