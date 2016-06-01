require_relative 'base_class_for_data_classes'
class Comments < BaseClassForDataClasses
  attr_accessor :Kind,
                :id,
                :story_id,
                :text,
                :person_id,
                :created_at,
                :updated_at

  def initialize(values = {})
    @values = values
  end

  def is_integer_value(integer_value)

    integer_value.is_a?Integer

=begin
    if integer_value > 0 then
      return true
    else
      return false
    end
=end
  end

  def is_string_value(string_value)

    return string_value.kind_of?String
  end

  def validate_id_parameter
    return is_integer_value(@values[:id])
  end

  def validate_person_id_parameter
    return is_integer_value(@values[:person_id])
  end

  def validate_story_id_parameter
    return is_integer_value(@values[:story_id])
  end

  def validate_Kind_parameter
    p @values[:kind]
    return is_string_value(@values[:kind])
  end

  def validate_text_parameter
    return is_string_value(@values[:text])
  end
end
