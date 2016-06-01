require_relative '../../src/data/comments'
require 'json'
class Validate
  def converting_to_json(json_object)
    @status_request, @json=json_object
    @hash_json = JSON.parse(@json)
    return @status_request, @hash_json
  end

  def is_integer_value(integer_value)
    integer_value.is_a? Integer
  end

  def is_string_value(string_value)
    string_value.kind_of? String
  end

  def text_is_between_a_range(text, min_length_character, max_length_character)
    if text.length >= min_length_character && text.length <= max_length_character
      true
    else
      false
    end
  end
end
