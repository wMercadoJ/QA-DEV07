require_relative 'base_class_for_data_classes'

class TaskDetails < BaseClassForDataClasses
  attr_accessor :complete,
                :description,
                :id,
                :kind,
                :position,
                :story_id,
                :created_at,
                :updated_at
                @type_value = ['task', 'story']
                @type_boolean = ['false', 'true']
                @hash = Hash.new
  def initialize(values = {})
    super(values)
  end

  def to_hash
    @hash = self.instance_variables.each_with_object({}){|var, hash| hash[var.to_s.delete('@')] = self.instance_variable_get(var)}
  end

  def field_valid(field, value)
    case
      when field == 'kind'
    p    @type_value.include?(value)
      when field == 'description'
        Validate.is_integer(value, 1000)
     p   value.kind_of?(String) && value.length < 1000
      when field == 'id'
        Validate.is_integer(value, 8)
        value.kind_of?(Integer) && value.length > 0 && value.length < 9
      when field == 'complete'
        @type_boolean.include?(value)
      when field == 'position'
        Validate.is_integer(value, 4)
        value.kind_of?(Integer) && value.length > 0 && value.length < 4
      else
        false
    end
  end

  def validate_fields
    validate_status = true
    object_hash = self.to_hash
    object_hash.each_pair do |key, value|
      validate_status = self.field_valid(key, value) && validate_status
    end
    validate_status
  end

end
