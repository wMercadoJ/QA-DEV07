require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/task'

Given(/^I have a (\d+) ID task from  Pivotal Tracker project the story for Task$/) do |task|
  @id_task = task.to_i
end

When(/^I send ID task DELETE request to (.*) for Task$/) do |path|
  @end_point_delete = path

    @status_delete, @response_delete = @client_task.delete(@end_point_delete)


end




