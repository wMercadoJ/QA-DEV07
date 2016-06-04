require_relative 'base_class_for_data_classes'

class TaskDetails < BaseClassForDataClasses
  TYPE_VALUE = ['task', 'story']
  TYPE_BOOLEAN = ['false', 'true']
  attr_accessor :complete,
                :description,
                :id,
                :kind,
                :position,
                :story_id,
                :created_at,
                :updated_at
                @hash = Hash.new
  def initialize(values = {})
    super(values)
  end

  def to_hash_task
    @hash = self.instance_variables.each_with_object({}){|var, hash| hash[var.to_s.delete('@')] = self.instance_variable_get(var)}
  end

  def field_valid_task (field, value)
    case
      when field == 'kind'
        TYPE_VALUE.include?(value)
      when field == 'description'
        value.kind_of?(String) && value.length < 1000
      when field == 'id'
        value.kind_of?(Integer) && value.to_s.length > 0 && value.to_s.length < 9
      when field == 'complete'
        TYPE_BOOLEAN.include?(value)
      when field == 'position'
        value.kind_of?(Integer) && value.to_s.length > 0 && value.to_s.length < 1000
      else
        false
    end
  end

  def validate_fields_task
    validate_status = true
    object_hash = self.to_hash
    object_hash.each_pair do |key, value|
      validate_status = self.field_valid_task(key, value) && validate_status
    end
    validate_status
  end

  end
