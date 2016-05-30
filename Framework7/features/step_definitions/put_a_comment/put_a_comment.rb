require_relative '../../../src/helpers/rest_client/api_rest_client'

Given(/^I have set another connection into pivotal_tracker API service$/) do
  @client = ApiRestClient.new
end
When(/^I send a Put request to (.*)$/) do |end_point|
  @status_request, @response = @client.put(end_point, [], {'text': 'updating a comment'})
end
Then(/^I expect Status code of put request (\d+)$/) do |status|
  expect(status.to_i).to eql(@status_request)
end
And(/^I expect that "(.*)"$/) do |arg1|
  expect(@response[:text]).to eql(arg1)
end