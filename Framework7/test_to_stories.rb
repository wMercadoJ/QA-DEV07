require_relative '../Framework7/src/helpers/rest_client/api_rest_client'
require_relative '../Framework7/src/requests/stories_post'

client = ApiRestClient.new
StoriesPost.new(client)