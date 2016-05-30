require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/comments'
require_relative '../../../src/requests/validate'


Given(/^I have set a connection to pivotal_tracker API service$/) do
  @client=ApiRestClient.new
end

When(/^I send a GET request to (\/projects\/1596603\/stories\/120320037\/comments)$/) do |end_point|
  validate = Comments_get.new
  @status_request = validate.validate_json(@client.get(end_point))
end

Then(/^I expect Status code (\d+)$/) do |status|
  expect(status.to_i).to eql(@status_request)
end