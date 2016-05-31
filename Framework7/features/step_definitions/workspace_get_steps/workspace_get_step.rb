require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/workspace_get'


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
  expect(@status_code.to_s).to eql(http_code.to_s)
end

