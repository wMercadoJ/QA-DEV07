require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/stories'
require_relative '../../../../Framework7/src/requests/stories_get'

Given(/^I have (\d+) of pivotal tracker project to story delete endpoint$/) do |project_id|
  @project_id = project_id
end

When(/^I have the (.*) ID of a Story to delete it$/) do |story_id|
  @story_id = story_id
end

When(/^I send a DELETE request to story endpoint (.*)$/) do |end_point|
  begin
    @status_code, @response = @client.delete(end_point)
  rescue Exception => e
    @error = e.http_code
  end
end

Then(/^I should expect the status code (\d+) to Story delete endpoint$/) do |http_code|
  if @status_code != nil
    expect(@status_code.to_s).to eql(http_code.to_s)
  else
    expect(@error).to eql(http_code.to_i)
  end
end

When(/^I have the new_story_id of a new Story to delete it$/) do
  @post_endpoint = "/projects/#{@project_id}/stories"
  _,@response_post = @client.post(@post_endpoint, [], {:name => "Story to deletette"})
  @id = @response_post[:id]
end

When(/^I send the DELETE request to story delete endpoint (.*)$/) do |end_point|
  begin
    @end_point = end_point + "#{@id}"
    @status_code, @response = @client.delete(@end_point)
  rescue Exception => e
    @error = e.http_code
  end
end