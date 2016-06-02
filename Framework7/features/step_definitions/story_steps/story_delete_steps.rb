require_relative '../../../src/helpers/rest_client/api_rest_client'
#require_relative '../../../src/data/story'

Given(/^I have (\d+) of pivotal tracker project to story delete endpoint$/) do |project_id|
  @project_id = project_id
end

When(/^I have the (\d+) ID of a Story to delete it$/) do |story_id|
  @story_id = story_id
end

When(/^I send a DELETE request to story endpoint (.*)$/) do |end_point|
  @status_code, @response = @client.delete(end_point)
end

Then(/^I should expect the status code (\d+) to Story delete endpoint$/) do |http_code|
  expect(@status_code.to_s).to eql("")
end