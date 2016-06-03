
class EpicDelete


  def self.epic_delete(client,endpoint, query_elements = [], body=nil)
    status_code, response = client.delete(endpoint, query_elements, body)
    [status_code, response]
  end

end
require_relative '../../helpers/rest_client/api_rest_client'
client=ApiRestClient.new

p EpicDelete.epic_delete(client,'projects/1600911/epics/2530409',[],nil)