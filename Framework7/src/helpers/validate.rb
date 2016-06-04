require_relative '../../src/data/comments'
require 'json'
class Validate
  def self.converting_to_json(json_object)
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

  def is_a_date(date)
    if date =~ (/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])T(0[0-9]|[1-5][0-9]):(0[0-9]|[1-5][0-9]):(0[0-9]|[1-5][0-9])Z$/)
      return true
    end
    false
  end

  def self.get_id_comment(json_array)
    @id_comments=Array.new
    json_array.each_index do |index|
      id = json_array[index]
      @id_comments.push(id['id'])
    end
    pi = Random.rand(0...(@id_comments.length-1))
    end_point = '/projects/1601145/stories/120813473/comments/'+@id_comments[pi].to_s

    return end_point
  end
end
