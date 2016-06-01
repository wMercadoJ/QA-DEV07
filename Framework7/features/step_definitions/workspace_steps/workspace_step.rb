require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/workspace_get'
require_relative '../../../src/requests/workspace_valid'


Given(/^I have set a connection to pivotal_tracker API service with workspace$/) do
  @client = ApiRestClient.new
end

When(/^I send workspace a (.*?) request to (.*?)$/) do |var, end_point|

  (var == "GET") ? (@status_code, @response = @client.get(end_point)):(@end_point = end_point)

end

When(/^I send workspace with its ID a (GET|DELETE) request to (.*?\/)(\d+)$/) do |method, end_point, id_project|


  endPointAndIdProject = "#{end_point}#{id_project}"

  (method == "GET") ? (@status_code, @response = @client.get(endPointAndIdProject)) : (@status_code, @response = @client.delete(endPointAndIdProject))

end

And(/^I send name (.*) and id_project (.*)$/) do |name, id_project|

  @name = name
  values = id_project.gsub(/(^\[)|(\]$)/,'')
  array_id_project = [values.to_i]

  (values == "") ? (para_json = {:name => name}) : (para_json = {:name => name, :project_ids => array_id_project})

  @status_code, @response = @client.post(@end_point,[], para_json)

end

Then(/^I expect Status code (\d+) of workspace$/) do |http_code|
  p @status_code
  expect(@status_code.to_s).to eql(http_code.to_s)
end


Then(/^I expect that (.*),(.*),(.*),(.*),(.*) workspace values are equals to$/) do |kind, id_workspace, name, id_owner, id_projects|

  values = id_projects.gsub(/(^\[)|(\]$)/,'')
  values2 = values.split("_").map { |s| s.to_i }

 (values == "")?(array_id_project = Array.new):(array_id_project = values2)

  expect(@response[:kind]).to eql(kind)
  expect(@response[:id]).to eql(id_workspace.to_i)
  expect(@response[:name]).to eql(name.to_s)
  expect(@response[:person_id]).to eql(id_owner.to_i)
  expect(@response[:project_ids]).to eql(array_id_project)

end


Then(/^I expect that workspace values are correct type$/) do


end