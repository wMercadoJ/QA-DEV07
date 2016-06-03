require_relative '../../../src/requests/epics/epic_get'

When(/^I send an? epic GET request to \/(:?projects)\/(\d+)\/(:?epics) endpoint$/) do |project_endpoint,id_project, epic_endpoint|
  endpoint="/#{project_endpoint}/#{id_project}/#{epic_endpoint}"
  id=  @id_epic.nil? ? '':@id_epic
  @status_code, @account_object =EpicGet.validate_endpoint(@client,endpoint,id)

end
