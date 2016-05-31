require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/task'
require 'json'

Given(/^I have set a connection to pivotal tracker API service$/) do
  @client = ApiRestClient.new
end

Given(/^I have ([1-9]{7}) from  Pivotal Tracker project$/) do |project_id|
  @project_id = project_id
end

Given(/^I have ([0-9]{9}) from  Pivotal Tracker project the story$/) do |story_id|
  @story_id = story_id
end
Given(/^I have (.*?) the task name$/) do|description_task|
    @description_task = description_task
end

When(/^I send my (POST|GET) request to (.*)/) do | method_task, end_point|
  @method_task=method_task
  if @method_task == 'GET'
   @status2,@response2 = @client.get(end_point)
    jsonArray = @response2
    @objArray = JSON.parse(jsonArray)
    @hashArray = Array.new

  else
   @status,@response = @client.post(end_point,[],{:description => @description_task})
#(client, end_point, project_id, story_id, description_task)
    end
end

Then(/^I should receive a Object details$/) do

  task_details = TaskDetails.new(@response)
  var = task_details.to_hash['kind']
  expect(var).to eql ('task')
end
