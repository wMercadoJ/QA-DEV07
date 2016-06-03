require_relative '../../../src/requests/epics/epic_delete'
require_relative '../../../src/data/epic/epic'

Given(/^I have the epic id to delete$/) do
  step "I send an epic GET request to /projects/#{@id_project}/epics endpoint"
  @epic_id_to_delete=@epic_object[0].id
end

When(/^I send an epic DELETE request to epics? endpoint$/) do
  @status_code, @response= EpicDelete.epic_delete(@client,"projects/#{@id_project}/epics/#{@epic_id_to_delete}",[],nil)
end

Then(/^I expect a delete status code (\d+)$/) do |http_code|
  http_code=''
  expect(@status_code.to_s).to eq(http_code)
end
