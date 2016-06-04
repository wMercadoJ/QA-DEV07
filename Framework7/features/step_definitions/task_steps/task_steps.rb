require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/task'
require 'json'

Given(/^I have set a connection to pivotal tracker API service for Task$/) do
  @client_task = ApiRestClient.new
end

Given(/^I have ([0-9]{9}) from  Pivotal Tracker project the story for Task$/) do |story_id|
  @story_id = story_id
end

Given(/^I have (.*?) the task's name$/) do |description_task|
  @description_task = description_task
end

Given(/I have (.*?) name, (.*?) complete, (.*?) position of a new task in Story$/) do |description_task, complete_boolean, position_task|
  @description_task = description_task.to_s
  case complete_boolean
    when 'True'
      @complete_boolean = true
    when 'false'
      @complete_boolean = false
    else
      @complete_boolean = nil
  end

  @position_task = position_task.to_i

end

When(/^I send my (POST|GET) request to (.*) for Task/) do |method_task, end_point|
  hash = {}
  @status_task, @response_task = nil

  @method_task=method_task

  if @method_task == 'GET'

    begin

      @status2, @response2 = @client_task.get(end_point)
     rescue => error
      error.response
      @status2 = error.http_code
      end

    if @status2 == 200
      jsonA = @response2
      @objArrayTask = JSON.parse(jsonA)
      @hashArrayTask = Array.new
    end

  elsif @method_task == 'POST'

    hash['description'] = @description_task unless @description_task.nil?
    hash['complete'] = @complete_boolean unless @complete_boolean.nil?
    hash['position'] = @position_task unless @position_task.nil? || @position_task == 0

    @status_task, @response_task = @client_task.post(end_point, [], hash)

  end
end

Then(/^I should receive a Object details for Task$/) do

  @task_detail = TaskDetails.new(@response_task)
  status_task = @task_detail.validate_fields_task
  expect(status_task).to eql(false)

end

Then(/^I expect the details of error message$/) do

  # @task_error_detail = TaskErrorDetails.new(@response_task)
  # jsonError = @response_task
  # @objErrorTask = JSON.parse(jsonError)
  # @hashErrorTask = Array.new
  # @objArray.each do |object|
  #   @hashArray.push(TaskDetails.new(object).to_hash_task)
  # end
  # p @hashArray

end

