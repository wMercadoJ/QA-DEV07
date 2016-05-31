require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/project_details'
require_relative '../../../../Framework7/src/requests/project_details_get'


Then(/^I expect Status the projects code (\d+)$/) do |http_code|

  expect(@status_code.to_s).to eql(http_code.to_s)
end

And(/^I expects projec Details Object$/) do
  me_details = ProjectDetails.new(@response)
  expect(me_details).to eql (ProjectDetails.new)
end

When(/^I send a GET request the projects to (\/projects\/.*)$/) do |end_point|

  @status_code, @response = @client.get(end_point)
end

Given(/^I have set a connection project to pivotal_tracker API service$/) do
  @client = ApiRestClient.new
end


And(/^it should have the field "([^"]*)" and "([^"]*)" containing the value (.*) and (.*)$/) do |arg1, arg2, idProjects, name|
  MeDetailsGet.validate_project_details(@client)
  project_details = ProjectDetails.new(@response)

  expect(project_details.id).to eql(idProjects.to_i)
  expect(project_details.name).to eql(name.to_s)
end


When(/^I a Delete the project (.*) in request the projects to (\/projects)$/) do |id_projects, end_point|
  @status_code, @response = @client.delete(end_point, [], id_projects)
end

When(/^I send a POST request to (\/projects) with name project (.*)$/) do |end_point, nameProject|
  json = { :name => nameProject, :public => true }
  @status_code, @response = @client.post(end_point, [], json)
  @end_point_post = end_point
end

When(/^I a Delete the project  in request the projects to (\/projects\/.*)$/) do |end_point|

  @status_code, @response = @client.delete(end_point)

end

And(/^I expect JSON for the name project equal a (.*)$/) do |name_project|
  MeDetailsGet.validate_project_details(@client)
  project_details = ProjectDetails.new(@response)
  expect(project_details.name).to eql(name_project.to_s)
  # @end_point_post = @end_point_post +'/'+ project_details.id
  # @client.delete(@end_point_post)
end