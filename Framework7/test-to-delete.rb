require_relative '../Framework7/src/helpers/rest_client/api_rest_client'
require_relative '../Framework7/src/requests/me_details_get'


p client = ApiRestClient.new
status, response = client.post("/projects/1595957/stories", [], {"name" => "story_new_test"})
p response
