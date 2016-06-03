
class EpicPut
  def self.epic_put(client,endpoint, query_elements = [], body=nil)
    status_code, response = client.put(endpoint, query_elements, body)
    [status_code, response]
  end
end

require_relative '../../helpers/rest_client/api_rest_client'
client=ApiRestClient.new

p EpicPut.epic_put(client,'projects/1600911/epics/2530343',[],{:name=>'new henry'})
