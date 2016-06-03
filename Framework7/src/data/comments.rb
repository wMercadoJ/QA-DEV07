require_relative 'base_class_for_data_classes'
require_relative '../helpers/validate'
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

  def validate_id_parameter
    Validate.new.is_integer_value(@values[:id])
  end

  def validate_person_id_parameter
    Validate.new.is_integer_value(@values[:person_id])
  end

  def validate_story_id_parameter
    Validate.new.is_integer_value(@values[:story_id])
  end

  def validate_kind_parameter
    Validate.new.is_string_value(@values[:kind])
  end

  def validate_text_parameter
    Validate.new.is_string_value(@values[:text])
  end

  def validate_length_text_parameter(min_length_character, max_length_character)
    Validate.new.text_is_between_a_range(@values[:text], min_length_character, max_length_character)
  end

  def validate_date_parameter(date)
    Validate.new.is_a_date(@values[date])
  end
end
