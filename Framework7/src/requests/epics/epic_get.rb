require_relative '../../data/epic/epic'

class EpicGet

  def self.get_epics(client, endpoint)
    url_elements = [
        endpoint,
    ]
    status_code, response_body = client.get(url_elements)
    epic_array=Array.new

    JSON.parse(response_body).each_with_index do |key|
      epic_array.push(Epic.new(key))
    end
     [status_code, epic_array]
  end
  def self.get_epic_by_id(client, endpoint, id)
    url_elements = [
        endpoint,
        id,
    ]
    status_code, response_body = client.get(url_elements)
    epic = Epic.new(response_body)
    [status_code, epic]
  end
  def self.validate_endpoint(client, endpoint, id='')
    status_code, epic = id==''? self.get_epics(client, endpoint): self.get_epic_by_id(client, endpoint, id)
    [status_code, epic]
  end

end
