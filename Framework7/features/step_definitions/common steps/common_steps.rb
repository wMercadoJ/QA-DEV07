require_relative '../../../src/helpers/rest_client/api_rest_client'


Given(/^I have set a connection to pivotal_tracker API service$/) do
  @client = ApiRestClient.new
end

