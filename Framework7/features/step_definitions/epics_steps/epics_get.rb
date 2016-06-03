require_relative '../../../src/requests/epics/epic_get'
require_relative '../../../src/data/epic/epic'

When(/^I send an? epic GET request to \/(:?projects)\/(\d+)\/(:?epics)(.*?)? endpoint$/) do |project_endpoint,id_project, epic_endpoint,id_epic|
  endpoint="/#{project_endpoint}/#{id_project}/#{epic_endpoint}/#{id_epic}"
  id_epic=  id_epic.nil? ? '':id_epic
  @status_code, @epic_object =EpicGet.validate_endpoint(@client,endpoint,id_epic)
end

Given(/^I have the ids of the epics$/) do

end

Then(/^I expect epic status code (\d+)$/) do |http_code|
  @epic_object.each do |epic|
    steps %Q{
      I send an epic GET request to /projects/#{epic.label['project_id']}/epics/#{epic.id} endpoint
      I expect epic status code 200
    }
    expect(@status_code.to_s).to eq(http_code.to_s)
  end

end

Then(/^I expect (true|false) as result of epics? fields? validations?$/) do |is_validated|
  @epic_object.each do |epic|
    steps %Q{
      I send an epic GET request to /projects/#{epic.label['project_id']}/epics/#{epic.id} endpoint
    }
    expect(epic.validate_field).to be Epic::BOOLEAN_VALUES.fetch(is_validated)
  end

end
