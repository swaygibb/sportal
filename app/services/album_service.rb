require 'net/http'
require 'json'
require 'base64'
require 'uri'

class AlbumService
    def get(session)
        albumList = []
        url = URI(ENV['SPOTIFY_ALBUM_URL'])

        return getAlbumPage(albumList, url, session)
    end

    def getAlbumPage(albumList, url, session)
        https = Net::HTTP.new(url.host, url.port);
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["Content-Type"] = "application/x-www-form-urlencoded"
        request["Authorization"] = "Bearer #{session[:spotify_token]}"

        response = https.request(request)
        responseBody = JSON.parse response.body

        responseBody['items'].each do |album|
            albumList.push(album)
        end

        #check if there are any more pages or not
        if responseBody['next'] and responseBody['next'].length > 0
            url = URI(URI.escape(responseBody['next']))
            albumList = getAlbumPage(albumList, url, session)
        end

        return albumList
    end
end