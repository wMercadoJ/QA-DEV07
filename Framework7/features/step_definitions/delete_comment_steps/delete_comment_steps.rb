require_relative '../../../src/helpers/rest_client/api_rest_client'

Given(/^I have set another connection to pivotal_tracker API service to delete a comment$/) do
  @client = ApiRestClient.new
  @status_request, @json = Validate.converting_to_json(@client.get('/projects/1601145/stories/120813473/comments'))
end

When(/^I send a Delete request$/) do
  limit = @json.length
  while limit> 5 do
    @status_request, @json = Validate.converting_to_json(@client.get('/projects/1601145/stories/120813473/comments'))
    @client.delete(Validate.get_id_comment(@json), [], {})
    limit=limit-1
  end
  @end_point = Validate.get_id_comment(@json)
  @status_delete, @response = @client.delete(@end_point, [], {})
end

Then(/^I expect Status code of delete request (\d+)$/) do |status|
  expect(status.to_i).to eql(@status_delete.to_i)
end

When(/^I send a Delete request (\/projects\/1601145\/stories\/120813473\/comments\/789987)$/) do |request|
  begin
    @client.delete(request, [], {})
  rescue => error
    p @error = error.http_code
  end
end

Then(/^I expect bad request code of delete request (\d+)$/) do |bad_request|
  expect(@error).to eql(bad_request.to_i)
end