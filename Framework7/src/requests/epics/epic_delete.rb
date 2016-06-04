
class EpicDelete


  def self.epic_delete(client,endpoint, query_elements = [], body=nil)
    status_code, response = client.delete(endpoint, query_elements, body)
    [status_code, response]
  end

end
