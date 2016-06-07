require_relative '../../../src/requests/epics/epic_post'

Given(/^I have a project created on pivotal tracker$/) do

end

Given(/^I have the id of that project$/) do
  @id_project=1600911
end

Given(/^I have the next epic as JSON:$/) do |epic_string|
  @epic_json=JSON.parse(epic_string)
end

When(/^I send an? epic POST request to \/(:?projects)\/(\d+)\/(:?epics) endpoint$/) do |project_endpoint,id_project, epic_endpoint|
  endpoint="/#{project_endpoint}/#{@id_project}/#{epic_endpoint}"
  @status_code, @response = EpicPost.epic_post(@client,endpoint,[],@epic_json)
  @epic_id_to_delete=@response[:id]
  EpicDelete.epic_delete(@client,"projects/#{@id_project}/epics/#{@epic_id_to_delete}",[],nil)
end
