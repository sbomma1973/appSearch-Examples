# `gem install elastic-app-search progress_bar`

require 'elastic-app-search'
require 'json'
require 'progress_bar'

API_ENDPOINT = 'https://224b406cf6854d498d594f3205b9d9e2.app-search.us-east-1.aws.found.io/api/as/v1/'
API_KEY = 'private-dze3yfxzms43siw4rn8huiw5'
ENGINE_NAME = 'webinardemo1'

client = Elastic::AppSearch::Client.new(:api_key => API_KEY, :api_endpoint => API_ENDPOINT)
file = File.read('/Users/satishbomma/Downloads/video-games.json')
data = JSON.parse(file)
bar = ProgressBar.new(data.count / 100)

data.each_slice(100) do |slice|
  client.index_documents(ENGINE_NAME, slice)
  bar.increment!
end
