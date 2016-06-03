require_relative '../../../src/requests/epics/epic_put'

Given(/^I have the next epic created$/) do |epic_string|
  endpoint="/projects/#{@id_project}/epics"
  @epic_json=JSON.parse(epic_string)
  _, @response = EpicPost.epic_post(@client,endpoint,[],@epic_json)
  @id_epic_created=@response[:id]
end
When(/^I send (:?example) as the new name of the epic$/) do |new_epic_name|
  @epic_update_data={'name'=>new_epic_name}
end
When(/^I send a epic UPDATE request to \/(:?projects)\/(\d+)\/(:?epics)? endpoint$/) do  |project_endpoint,id_project, epic_endpoint|
  endpoint="/#{project_endpoint}/#{@id_project}/#{epic_endpoint}/#{@id_epic_created}"
  @status_code, @response = EpicPut.epic_put(@client,endpoint,[],@epic_update_data)
end

Then(/^I should delete the epic created$/) do
  @epic_id_to_delete=@response[:id]
  EpicDelete.epic_delete(@client,"projects/#{@id_project}/epics/#{@epic_id_to_delete}",[],nil)
end
