require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/project_details'
require_relative '../../../../Framework7/src/requests/project_details_get'


Then(/^I expect Status the projects code (\d+)$/) do |http_code|

  expect(@status_code.to_s).to eql(http_code.to_s)
end

And(/^I expects project Details Object$/) do
  me_details = ProjectDetails.new(@response)
  expect(me_details).to eql (ProjectDetails.new)
end

When(/^I send a GET request the projects to (\/projects\/.*)$/) do |end_point|

  @end_point = end_point
  @status_code, @response = @client.get(end_point)
  @project_details = ProjectDetails.new(@response)
end

Given(/^I have set a connection project to pivotal_tracker API service$/) do
  @client = ApiRestClient.new
end


And(/^it should have the field "([^"]*)" and "([^"]*)" containing the value (.*) and (.*)$/) do |arg1, arg2, idProjects, name|
#  MeDetailsGet.validate_project_details(@client)


  expect(@project_details.id).to eql(idProjects.to_i)
  expect(@project_details.name).to eql(name.to_s)
end


When(/^I a Delete the project (.*) in request the projects to (\/projects)$/) do |id_projects, end_point|
  @status_code, @response = @client.delete(end_point, [], id_projects)
end

When(/^I send a POST request to (\/projects) with name project (.*)$/) do |end_point, nameProject|

  json = { :name => nameProject, :public => true }
  @status_code, @response = @client.post(end_point, [], json)
  @end_point_post = end_point
  project_details = ProjectDetails.new(@response)
  id_deletes=Hash.new
  id_deletes.store(project_details.id, project_details.name)
  delete_projects(id_deletes,end_point)
end

When(/^I a Delete the project  in request the projects to (\/projects\/.*)$/) do |end_point|

   @status_code, @response = @client.delete("/#{end_point}/#{@id_delete}")
end

And(/^I expect JSON for the name project equal a (.*)$/) do |name_project|
#  MeDetailsGet.validate_project_details(@client)
  project_details = ProjectDetails.new(@response)
  expect(project_details.name).to eql(name_project.to_s)
  # @end_point_post = @end_point_post +'/'+ project_details.id
  # @client.delete(@end_point_post)
end

And(/^I expect name project is less than (\d+) letters$/) do |size_word|
  expect(true).to eql(ProjectDetailsGet.validate_word_length(@project_details.name, size_word))

end

And(/^I expect the project should have the new attributes:$/) do |table|
  attribute_type=Hash.new
  table.hashes.each_with_object({}) do |row|
    attribute_type[row['attribute']]= row['type']
  end
  expect(true).to eql(ProjectDetailsGet.validate_word_type(@project_details.name))
  expect(true).to eql(ProjectDetailsGet.validate_word_type(@project_details.kind))
  expect(true).to eql(ProjectDetailsGet.validate_word_type(@project_details.iteration_length))
  expect(true).to eql(ProjectDetailsGet.validate_int(@project_details.id))
  expect(true).to eql(ProjectDetailsGet.validate_date(@project_details.created_at))
end


And(/^I expect kind field in the project is equals a (.*)$/) do |value_kind|
  expect(value_kind.to_s).to eql(@project_details.kind)
end


And(/^I have have  least one project create in (\/projects\/)$/) do |end_point|
  json = { :name => 'Project delete', :public => true }
  status_code, response = @client.post(end_point, [], json)
  project_details = ProjectDetails.new(response)
  @id_delete = project_details.id

  @id_delete
end


def delete_projects(list_id_projects, end_point)
  list_id_projects.each_key { |id| @client.delete("/#{end_point}/#{id}")}
end

And(/^I expect the project should id have less than (\d+) characters:$/) do |size|
  expect(true).to eql(ProjectDetailsGet.validate_word_length(@project_details.id, size))
end