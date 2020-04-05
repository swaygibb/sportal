require 'net/http'
require 'json'
require_relative "../services/userinfo_service"

module UserinfoHelper
    def getUserInfo()
        @userInfoService = UserinfoService.new
        @tester = @userInfoService.serviceTest()
        #logger.debug @tester
        return JSON.parse(@tester)
    end
end


# module ApiHelper
#     def getParts()
#         url = "#{ENV['API_URL']}/parts"
#         uri = URI(url)
#         response = Net::HTTP.get(uri)
#         return JSON.parse(response, object_class: OpenStruct)
#     end

#     def getPart(id)
#         url = "#{ENV['API_URL']}/parts/#{id}"
#         uri = URI(url)
#         response = Net::HTTP.get(uri)
#         return JSON.parse(response, object_class: OpenStruct)
#     end
# end

