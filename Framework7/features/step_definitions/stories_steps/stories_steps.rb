require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/stories'
require_relative '../../../../Framework7/src/requests/stories_get'

Given(/^I have ([0-9]*) of pivotal tracker project to Stories endpoint$/) do |project_id|
  @project_id = project_id
end

When(/^I have the (.*) name of new story$/) do |name_story|
  @name_story = name_story
end

When /^I send a POST request to (.*) to Stories endpoint$/ do |end_point|
  begin
    @status_code, @response = @client.post(end_point, [], {:name => @name_story})
  rescue Exception => e
    @error = e.http_code
  end
end

Then(/^I should expect the status code (.*) for post request to Stories endpoint$/) do |http_code|
  if @status_code != nil
    expect(@status_code.to_s).to eql(http_code.to_s)
  else
    expect(@error).to eql(http_code.to_i)
  end
end

Given(/^I have stories created in pivotal tracker$/) do
end

When(/^I send the GET request to (.*) to Stories endpoint$/) do |end_point|
  begin
    @status_code, @response = @client.get(end_point)
  rescue Exception => e
    @error = e.http_code
    #error.response
  end
end

Then(/^I should expect the status code (\d+) to Get request to Stories endpoint/) do |http_code|
  if @status_code != nil
    expect(@status_code.to_s).to eql(http_code.to_s)
  else
    expect(@error).to eql(http_code.to_i)
  end
end

Then(/^I should expect that the kind of this story is Story$/) do
  story = Stories.new(@response)
  expect(story.kind).to eql('story')
end

Then(/^I should validate that the name is string$/) do
  story = Stories.new(@response)

  if StoriesDetailsGet.validate_story_name(story.name)
    expect(story.name).to eql(@name_story)
  end
end

When(/^I have the empty name for a new story$/) do
  @name_story = ''
end

Then(/^I should expect the status code (.*) for post request to Stories endpoint with name different to string/) do |http_code|
  expect(@error).to eql(http_code.to_i)
end

Given(/^I send the GET request to (.*) with nonexistent project ID$/) do |end_point|
  begin
    @status_code, @response = @client.get(end_point)
  rescue Exception => e
    @error = e.http_code
  end
end

When(/^I have the number (.*) for a new story$/) do |integer_name|
  @name_story = integer_name.to_i
end
