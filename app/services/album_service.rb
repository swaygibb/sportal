require 'net/http'
require 'json'
require 'base64'
require 'uri'

class AlbumService
    def get(session)
        url = URI(ENV['SPOTIFY_ALBUM_URL'])

        https = Net::HTTP.new(url.host, url.port);
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["Content-Type"] = "application/x-www-form-urlencoded"
        request["Authorization"] = "Bearer #{session[:spotify_token]}"

        response = https.request(request)
        return response
    end
end