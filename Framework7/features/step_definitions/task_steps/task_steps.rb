require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/task'

Given(/^I have set a connection to pivotal tracker API service$/) do
  @client=ApiRestClient.new
end

Given(/^I have ([1-9]{7}) from  Pivotal Tracker project the project$/) do |project_id|
  @project_id=project_id
end

Given(/^I have ([0-9]{9}) from  Pivotal Tracker project the story$/) do |story_id|
  @story_id=story_id
end
Given(/^I have (.*?) the task name$/) do|description_task|
   p @description_task=description_task
end
When(/^I send my POST request to (.*)/) do |end_point|
  p end_point
  p @response = @client.post(end_point,[],{:description => @description_task})
#(end_point,project_id,story_id,description_task)
end
Then(/^I should create a new task$/) do
  puts "test"
end

Then(/^I should receive a Object details$/) do
  puts "test"
end