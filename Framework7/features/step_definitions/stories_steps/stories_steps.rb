require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/stories'

Given(/^I have ([0-9]*) of pivotal tracker project to Stories endpoint$/) do |project_id|
  @project_id = project_id
end

When(/^I have the (.*) name of new story$/) do |name_story|
  @name_story = name_story
end

When /^I send a POST request to (.*) to Stories endpoint$/ do |end_point|
  @status_code, @response = @client.post(end_point, [], {:name => @name_story})
  p @response, @status_code
end

Then(/^I should expect the status code (\d+) to Stories endpoint$/) do |http_code|
  expect(@status_code.to_s).to eql(http_code.to_s)
end

Then(/^I should validate the name and project_id story$/) do
  story = Stories.new(@response)
end