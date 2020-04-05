require 'net/http'
require 'json'
require 'base64'
require "uri"

class UserinfoService
    def get(session)
        url = URI("https://api.spotify.com/v1/me")

        https = Net::HTTP.new(url.host, url.port);
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["Content-Type"] = "application/x-www-form-urlencoded"
        request["Authorization"] = "Bearer #{session[:spotify_token]}"

        response = https.request(request)
        return response
    end
end