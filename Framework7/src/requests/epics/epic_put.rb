
class EpicPut
  def self.epic_put(client,endpoint, query_elements = [], body=nil)
    status_code, response = client.put(endpoint, query_elements, body)
    [status_code, response]
  end
end