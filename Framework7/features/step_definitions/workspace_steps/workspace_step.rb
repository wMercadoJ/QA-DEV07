require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/workspace_get'
require_relative '../../../src/requests/workspace_valid'
require_relative '../../../src/data/error_details'


Given(/^I have set a connection to pivotal_tracker API service with workspace$/) do
  @client = ApiRestClient.new
  @end_point = '/my/workspaces'
end

When(/^I send workspace a (GET|DELETE) request to (.*?)$/) do |method, end_point|

   if method == 'DELETE'
    (
    @status_code, @response = @client.delete("/my/workspaces/#{@response[:id]}")
    @status_code = @status_code.to_i

    )
  else
    (@status_code, @response = @client.get(end_point))
  end

end

When(/^I send workspace with its ID a GET request to (.*?\/)(\d+)$/) do |end_point, id_project|

  end_point_and_id_project = "#{end_point}#{id_project}"
begin
  @status_code, @response = @client.get(end_point_and_id_project)
rescue => e

  e.response
  @status_code = e.http_code

  @response_error = Error_details.new(JSON.parse(e.response))

  end
end

And(/^I (send|have) workspaces with name (.*) and id_projects (.*)$/) do |type, name, id_project|

  values = id_project.gsub(/(^\[)|(\]$)/,'')
  array_id_project = [values.to_i]

  (values == '') ? (para_json = {:name => name}) : (para_json = {:name => name, :project_ids => array_id_project})

  @status_code, @response = @client.post(@end_point,[], para_json)

   if type == 'send'

 _, _ = @client.delete("/my/workspaces/#{@response[:id]}")
  end

end

Then(/^I expect Status code (\d+) of workspace$/) do |http_code|

     expect(@status_code.to_s).to eql(http_code.to_s)
end


Then(/^I expect that (.*),(.*),(.*),(.*),(.*) workspace values are equals to$/) do |kind, id_workspace, name, id_owner, id_projects|

  values = id_projects.gsub(/(^\[)|(\]$)/,'')
  values2 = values.split('_').map { |s| s.to_i }

 (values == '')?(array_id_project = Array.new):(array_id_project = values2)

  expect(@response[:kind]).to eql(kind)
  expect(@response[:id]).to eql(id_workspace.to_i)
  expect(@response[:name]).to eql(name.to_s)
  expect(@response[:person_id]).to eql(id_owner.to_i)
  expect(@response[:project_ids]).to eql(array_id_project)

end


Then(/^I expect that workspace values are correct type$/) do

hash_fail = WorkspaceValid.validate_workspace_values(@response)

  expect(hash_fail.empty?).to eql(true)

end

When(/^I send workspace a POST request to (.*?)$/) do|var|
  @end_point = var
end

And(/^I send a (invalid|valid) name (.*) and (invalid|valid) id_project (.*)$/) do |_, name, _, id_project|

  values = id_project.gsub(/(^\[)|(\]$)/,'')
  array_id_project = [values.to_i]

  (values == '') ? (para_json = {:name => name}) : (para_json = {:name => name, :project_ids => array_id_project})
  begin
    @status_code, @response = @client.post(@end_point,[], para_json)
  rescue => e
  p e.response
    @status_code = e.http_code

  @response_error = Error_details.new(JSON.parse(e.response))
  end

end

Then(/^I expect a message of error for (.*?)$/) do |_|
  expect(true).to eql(@response_error.validate_fields_symbol)
end