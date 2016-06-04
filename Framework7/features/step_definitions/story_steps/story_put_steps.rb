require_relative '../../../src/helpers/rest_client/api_rest_client'
#require_relative '../../../src/data/story'

Given(/^I have (.*) of pivotal tracker project to story put endpoint$/) do |project_id|
  @project_id = project_id
end

When(/^I have the (.*) ID of a Story to update it$/) do |story_id|
  @story_id = story_id
end

When(/^I send the (.*) to update$/) do |new_name|
  @name_story = new_name
end

When(/^I send a PUT request to story endpoint (.*)$/) do |end_point|
  begin
    @status_code, @response = @client.put(end_point,[],{"name":@name_story})
  rescue Exception => e
    @error = e.http_code
  end

end

Then(/^I should expect the status code (.*) to Story PUT endpoint$/) do |http_code|

  if @status_code != nil
    expect(@status_code.to_s).to eql(http_code.to_s)
  else
    expect(@error).to eql(http_code.to_i)
  end
end

