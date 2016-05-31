require_relative '../../../src/helpers/rest_client/api_rest_client'
#@Smoke
Then(/^I expect Status code (\d+) to task$/) do |code|
  expect(@status2.to_s).to eql(code.to_s)
end
#@Functional
And(/^I expect number test (.*) id task (.*),kind (.*),is story (.*),description (.*), complete (.*), position (.*), created date (.*), updated date (.*)$/) do |number, id_task, kind, story_id, description, complete, position, created_at, updated_at|
 @number=number.to_i
 @id_task = id_task.to_i
  @kind_task = kind.to_s
  @id_story = story_id.to_i
  @description_task = description.to_s
  @complete = complete.to_s
  @position = position.to_i
  @created_date = created_at.to_s
  @updated_date = updated_at.to_s

  @objArray.each do |object|
   @hashArray.push(TaskDetails.new(object).to_hash)
  end

  expect(@id_task).to eql (@hashArray[@number].to_hash['id'])
  expect(@kind_task).to eql (@hashArray[@number].to_hash['kind'])
  expect(@id_story).to eql (@hashArray[@number].to_hash['story_id'])
  expect(@description_task).to eql (@hashArray[@number].to_hash['description'])
  expect(@complete).to eql (@hashArray[@number].to_hash['complete'].to_s)
  expect(@position).to eql (@hashArray[@number].to_hash['position'])
  expect(@created_date).to eql (@hashArray[@number].to_hash['created_at'])
  expect(@updated_date).to eql (@hashArray[@number].to_hash['updated_at'])

end

Then(/^I expect TaskDetails Object to task$/) do
 # task_details = TaskDetails.new(@response_task)
 # expect(task_details).to eql (TaskDetails.new)
  puts "test"
end


