require 'open-uri'
require 'json'
require 'rest-client'

OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

url = "https://moat.ai/api/task/"
response = RestClient.get(url, headers={:Basic => 'ZGV2ZWxvcGVyOlpHVjJaV3h2Y0dWeQ=='})
results = JSON.parse(response.body)

results.each do |result|
  result[0]["name"] = {
    artist_id: result[0]["id"],
    name: result[0]["name"],
    twitter: result[0]["twitter"]
  }
end
