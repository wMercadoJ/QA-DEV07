require_relative '../Framework7/src/helpers/rest_client/api_rest_client'
require_relative '../Framework7/src/requests/me_details_get'

p client = ApiRestClient.new
MeDetailsGet.validate_me_details(client)


