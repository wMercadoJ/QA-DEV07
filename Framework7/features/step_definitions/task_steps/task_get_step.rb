require_relative '../../../src/helpers/rest_client/api_rest_client'

Then(/^I expect Status code (\d+) to task$/) do |code|
  expect(@status.to_s).to eql(code.to_s)
end
Then(/^I expect TaskDetails Object to task$/) do
 # task_details = TaskDetails.new(@response_task)
 # expect(task_details).to eql (TaskDetails.new)
  puts "test"
end
