
class EpicPost
  def self.epic_post(client,endpoint, query_elements = [], body=nil)
    status_code, response = client.post(endpoint, query_elements, body)
    [status_code, response]
  end
end
