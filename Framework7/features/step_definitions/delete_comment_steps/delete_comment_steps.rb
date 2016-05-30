require_relative '../../../src/helpers/rest_client/api_rest_client'

Given(/^I have set another connection to pivotal_tracker API service to delete a comment$/) do
  @client = ApiRestClient.new
end
When(/^I send a Delete request to (.*)$/) do |end_point|
  @status_request, @response = @client.delete(end_point, [], {})
end

Then(/^I expect Status code of delete request (\d+)$/) do |status|
  expect(status.to_i).to eql(@status_request.to_i)
end