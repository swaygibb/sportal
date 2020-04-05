require 'net/http'
require 'json'
require 'base64'
require "uri"

class SpotifyAuthorizationService
    def authorize(session)

        url = URI(ENV['SPOTIFY_AUTHORIZATION_URL'])
        basic_token = Base64.strict_encode64("#{ENV['SPOTIFY_CLIENT_ID']}:#{ENV['SPOTIFY_CLIENT_SECRET']}")

        http = Net::HTTP.new(url.host, url.port);
        http.use_ssl = true

        request = Net::HTTP::Post.new(url)
        request.body = "grant_type=authorization_code&code=#{session[:spotify_code]}&redirect_uri=http://localhost:3000/spotifycallback"
        request["Content-Type"] = "application/x-www-form-urlencoded"
        request["Authorization"] = "Basic #{basic_token}"

        response = http.request(request)

        response_body = JSON.parse response.read_body
        Rails.logger.debug response_body
        if response.code == "200"
            $spotify_token = response_body["access_token"]
            session[:spotify_token] = $spotify_token
            return $spotify_token
        end 

        return ""
    end
end