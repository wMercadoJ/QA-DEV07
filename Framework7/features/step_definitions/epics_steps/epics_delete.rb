require_relative '../../../src/requests/epics/epic_delete'
require_relative '../../../src/data/epic/epic'

Given(/^I have the epic id to delete$/) do
  endpoint="/projects/#{@id_project}/epics"
  @epic_json={'name'=>'epic to delete'}
  _, @response = EpicPost.epic_post(@client,endpoint,[],@epic_json)
  @id_epic_created=@response[:id]
end

When(/^I send an epic DELETE request to epics? endpoint$/) do
  @status_code, @response= EpicDelete.epic_delete(@client,"projects/#{@id_project}/epics/#{@id_epic_created}",[],nil)
end

Then(/^I expect a delete status code (\d+)$/) do |http_code|
  http_code=''
  expect(@status_code.to_s).to eq(http_code)
end
