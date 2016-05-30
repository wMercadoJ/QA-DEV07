require_relative '../Framework7/src/helpers/rest_client/api_rest_client'
require_relative 'src/requests/project_details_get'

# p client = ApiRestClient.new
# MeDetailsGet.validate_me_details(client)
p client = ApiRestClient.new
MeDetailsGet.validate_project_details(client)



