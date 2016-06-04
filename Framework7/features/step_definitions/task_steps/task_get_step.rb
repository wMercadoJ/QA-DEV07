require_relative '../../../src/helpers/rest_client/api_rest_client'

#@Smoke
Then(/^I expect status code (\d+) to task$/) do |code|

  if @method_task == 'GET'
    expect(@status2.to_s).to eql(code.to_s)
  elsif @method_task == 'POST'
    expect(@status_task.to_s).to eql(code.to_s)
  elsif @method == 'DELETE'
    expect(@status_delete.to_s).to eql(code.to_s)
  end

end

#@Functional
And(/^I expect TaskDetails of number test (\d+), id task (\d+),kind (.*?),is story (\d+),description (.*?), complete (.*?), position (\d+), created date (.*), updated date (.*) for Task$/) do |number, id_task, kind_get, story_id, description_get, complete_get, position_get, created_at, updated_at|

  @number =number.to_i
  @id_task = id_task.to_i
  @kind_task = kind_get.to_s
  @id_story = story_id.to_i
  @description_get = description_get.to_s
  @complete_get = complete_get.to_s
  @position_get = position_get.to_i
  @created_date = created_at.to_s
  @updated_date = updated_at.to_s

  @objArrayTask.each do |object|
    @hashArrayTask.push(TaskDetails.new(object).to_hash_task)
  end

   expect(@id_task).to eql (@hashArrayTask[@number]['id'])
   expect(@kind_task).to eql (@hashArrayTask[@number]['kind'])
   expect(@id_story).to eql (@hashArrayTask[@number]['story_id'])
   expect(@description_get).to eql (@hashArrayTask[@number]['description'])
   expect(@complete_get).to eql (@hashArrayTask[@number]['complete'].to_s)
   expect(@position_get).to eql (@hashArrayTask[@number]['position'])
   expect(@created_date).to eql (@hashArrayTask[@number]['created_at'])
   expect(@updated_date).to eql (@hashArrayTask[@number]['updated_at'])

end

