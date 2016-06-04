require_relative '../../../src/helpers/rest_client/api_rest_client'
#require_relative '../../../src/data/story'

Given(/^I have (.*) of pivotal tracker project to Story endpoint$/) do |project_id|
  @project_id = project_id
end

When(/^I have the (.*) ID of a Story$/) do |story_id|
  @story_id = story_id
end

When /^I send a GET request (.*) to Story endpoint$/ do |end_point|
  begin
    @status_code, @response = @client.get(end_point)
  rescue Exception => e
    @error = e.http_code
  end
end

Then(/^I should expect the status code (.*) to Story endpoint$/) do |http_code|
  if @status_code != nil
    expect(@status_code.to_s).to eql(http_code.to_s)
  else
    expect(@error).to eql(http_code.to_i)
  end
end

Then(/^I should expect that the kind of story is Story$/) do
  story = Stories.new(@response)
  expect(story.kind).to eql("story")
end

Then(/^I should validate that the name of story is string$/) do
  story = Stories.new(@response)
  StoriesDetailsGet.validate_story_name(story.name)
end