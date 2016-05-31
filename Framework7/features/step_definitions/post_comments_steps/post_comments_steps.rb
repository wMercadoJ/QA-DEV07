require_relative '../../../src/helpers/rest_client/api_rest_client'

Given(/^I have set another connection to pivotal_tracker API service$/) do
  @client = ApiRestClient.new
end
When(/^I send a Post request to (\/projects\/1596603\/stories\/120320037\/comments)$/) do |end_point|
  @status_request, @response = @client.post(end_point, [], '{"text": "bruno test 3"}')
end
Then(/^I expect Status code of post request (\d+)$/) do |status|
  expect(status.to_i).to eql(@status_request)
end
