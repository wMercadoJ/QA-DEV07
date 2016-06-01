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
    @description_tas = description_task
end

Given(/I have (.*?) name, (.*?) complete, (.*?) position of a new task$/) do |description_task, complete_boolean, position_task|
  @description_tas = description_task.to_s
  @complete_boolean = complete_boolean.to_s
  @position_task = position_task.to_i

end

When(/^I send my (POST|GET) request to (.*)/) do | method_task, end_point|
  @method_task=method_task
# p @description_task
  if @method_task == 'GET'
   @status2,@response2 = @client.get(end_point)
    jsonArray = @response2
    @objArray = JSON.parse(jsonArray)
    @hashArray = Array.new

  elsif @method_task == 'POST'

    case
      when !@description_task.nil? && !@complete_boolean.nil? &&  !@position_task.nil?
      p @description_task
        @status,@response = @client.post(end_point,[],{:description => @description_task, :complete => @complete_boolean, :position => @position_task})
      when !@description_task.nil? && !@complete_boolean.nil?
        @status,@response = @client.post(end_point,[],{:description => @description_task, :complete => @complete_boolean})
      when !@description_task.nil? && !@complete_boolean.nil? &&  !@position_task.nil?
        @status,@response = @client.post(end_point,[],{:description => @description_task, :position => @position_task})
      when !@description_tas.nil?
        @status,@response = @client.post(end_point,[],{:description => @description_tas})
      when @description_task.nil?
        false
    end

    end
end

Then(/^I should receive a Object details$/) do

  @task_detail = TaskDetails.new(@response)
  status = @task_detail.validate_fields
  expect(status).to eql(false)

end

Then(/^I should receive all properties of Task$/) do
  #if task_details != ''

  #end

end

