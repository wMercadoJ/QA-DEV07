require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/stories'

Given(/^I have set a connection to pivotal tracker API service$/) do
  @client = ApiRestClient.new
end
Given(/^I have ([0-9]*) of pivotal tracker project$/) do |project_id|
  @project_id = project_id
end

Given /^I have the (.*) name of story$/ do |name_story|
  @name_story = name_story
end

When /^I send a POST request to (.*)$/ do |end_point|
  @response = @client.post(end_point, [], {:name => @name_story})
  p @response
end

Then(/^I should create a new story$/) do

end

Then(/^I should validate object details$/) do
  story = Stories.new(@response)
end
