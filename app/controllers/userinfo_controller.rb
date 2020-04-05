class UserinfoController < ApplicationController

    #before_action :set_part, only: [:show, :update, :destroy]

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

    # POST /userinfo
    def create
        #@part = Part.create!(part_params)
        #json_response(@part, :created)
    end

    # GET /userinfo/:id
    def show
        #render json: @part, include: 'items'   
    end

    # PUT /userinfo/:id
    def update
        #@part.update(part_params)
        #head :no_content
    end

    # DELETE /userinfo/:id
    def destroy
        #@part.destroy
        #head :no_content
    end

    private

    def user_params
        # whitelist params
        #params.permit(:title, :created_by)
    end

    def set_user
        #@part = Part.find(params[:id])
    end
end
