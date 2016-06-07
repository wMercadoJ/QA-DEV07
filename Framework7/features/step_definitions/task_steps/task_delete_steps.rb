require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/task'

When(/^I send ID task DELETE request to (.*)for Task$/) do | path|
    @status_delete, @response_delete = @client_task.get(path)
    jsonDelete = @response_delete
    @objArrayTaskDelete = JSON.parse(jsonDelete)

    @status_delete, @response_delete = @client_task.delete(TaskDetails.get_id_task(@objArrayTaskDelete) )

end




