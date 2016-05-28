require_relative '../../src/data/comments'
require 'json'
class Comments_get
  def validate_json(json_object)

    @status_request, @json=json_object
    hash_json = JSON.parse(@json)
    hash_json.each do |index|
      index.each do |key, value|
      end
    end
    return @status_request, @json
  end
end
