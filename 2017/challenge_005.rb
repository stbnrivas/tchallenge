# requirements:
# because i dont have access to https://52.49.91.111:8443
# we will suppose that is a json api
# npm install --global json-server 
# step 1 : create a db.json 
# step 2 : launch $ json-server -p 8843 --watch challenge_005.json
# step 3 : url of endpoints http://localhost:8843/characters

require "net/http"
require "json"


class ApiConsumer
    attr_reader :last_response
    def initialize(url)
        uri = URI(url)
        @last_response = Net::HTTP.get(uri)        
    end
end


consumer = ApiConsumer.new("http://localhost:8843/characters")
data = JSON.parse(consumer.last_response)

i = 1
data.each do |child|
    puts "Case \##{i}: #{child.inspect}"
    i=i+1
end