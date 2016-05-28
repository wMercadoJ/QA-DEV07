require_relative '../Framework7/src/helpers/rest_client/api_rest_client'
require_relative '../Framework7/src/requests/me_details_get'
require_relative '../Framework7/src/requests/account/account_get'
p client = ApiRestClient.new

#p MeDetailsGet.validate_me_details(client)
p AccountGet.validate_endpoint(client,'accounts','887587')
