require_relative '../Framework7/src/helpers/rest_client/api_rest_client'
require_relative '../Framework7/src/requests/workspace_get_get'

p client = ApiRestClient.new
WorkspaceGet_Get.validate_me_details(client)
