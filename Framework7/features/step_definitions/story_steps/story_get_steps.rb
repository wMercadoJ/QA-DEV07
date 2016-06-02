require_relative '../../../src/helpers/rest_client/api_rest_client'
#require_relative '../../../src/data/story'

Given(/^I have ([0-9]*) of pivotal tracker project to Story endpoint$/) do |project_id|
  @project_id = project_id
end

When(/^I have the ([0-9]*) ID of a Story$/) do |story_id|
  @story_id = story_id
end

When /^I send a GET request (.*) to Story endpoint$/ do |end_point|
  @status_code, @response = @client.get(end_point)
  p @response, @status_code
end

Then(/^I should expect the status code (\d+) to Story endpoint$/) do |http_code|
  expect(@status_code.to_s).to eql(http_code.to_s)
end