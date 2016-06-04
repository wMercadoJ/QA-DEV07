require_relative '../../../src/helpers/rest_client/api_rest_client'

Given(/^I have set another connection into pivotal_tracker API service$/) do
  @client = ApiRestClient.new
  @status_request, @json = Validate.converting_to_json(@client.get('/projects/1601145/stories/120813473/comments'))
  @end_point = Validate.get_id_comment(@json)
end
When(/^I send a Put request$/) do
  @status_request, @response = @client.put(@end_point, [], {'text': 'updating a comment'})
end
Then(/^I expect Status code of put request (\d+)$/) do |status|
  expect(status.to_i).to eql(@status_request)
end
And(/^I expect that "(.*)"$/) do |arg1|
  expect(@response[:text]).to eql(arg1)
end
When(/^I write a comment with the (\d+) character to update a comment$/) do |amount_of_characters|

  @updated_text_comment = 'Bruno'*amount_of_characters.to_i
end

And(/^I send Put request with the previous text to update a comment$/) do
  @status_request, @response = @client.put(@end_point, [], {'text': @updated_text_comment})
end

And(/^I expect True as an answer of the updated comment$/) do
  expect(@updated_text_comment).to eql(@response[:text])
end