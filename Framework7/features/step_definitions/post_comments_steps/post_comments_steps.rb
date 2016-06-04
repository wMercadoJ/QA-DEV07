require_relative '../../../src/helpers/rest_client/api_rest_client'

Given(/^I have set another connection to pivotal_tracker API service$/) do
  @client = ApiRestClient.new
end
When(/^I send a Post request to (\/projects\/1601145\/stories\/120813473\/comments)$/) do |end_point|
  @status_request, @response = @client.post(end_point, [], {'text'=> 'bruno test 75'})
end

Then(/^I expect Status code of post request (\d+)$/) do |status|
  expect(status.to_i).to eql(@status_request)
end

And(/^I expect comment that is "([^"]*)"$/) do |arg1|
  expect(@response[:text]).to eql(arg1)
end
When(/^I write a comment with the (\d+) character in the comment$/) do |amount_of_characters|
  @text_comment = 'Bruno'*amount_of_characters.to_i
end

When(/^I send a Post request to (\/projects\/1601145\/stories\/120813473\/comments) with the previous text$/) do |end_point|
  @status_request, @response = @client.post(end_point, [], {'text'=> @text_comment})
end

When(/^I send a Post request to (\/projects\/1601145\/stories\/120813473\/comments) with the bad text$/) do |end_point|
  begin
    @status_request, @response = @client.post(end_point, [], {'text'=> @text_comment})
  rescue => @error
  end
end

Then(/^I expect bad request code of post request (\d+)$/) do |bad_request|
  expect(@error.http_code).to eql(bad_request.to_i)
end