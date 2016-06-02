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

  def to_hash
    @hash = self.instance_variables.each_with_object({}){|var, hash| hash[var.to_s.delete('@')] = self.instance_variable_get(var)}
  end

  def field_valid(field, value)
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

  def validate_fields
    validate_status = true
    object_hash = self.to_hash
    object_hash.each_pair do |key, value|
      validate_status = self.field_valid(key, value) && validate_status
    end
    validate_status
  end
  def boolean_data data
    (data == '')? (return nil):()
    (data == 'true')? (return true):()
    (data == 'false')? (return false):()
  end

  def store_hash_data description, complete, position
    @name_task = description
    @boolean = complete
    @position = position
    @hash_json = Hash.new

    case
      when !@name_task.nil?
        @hash_json.store('description',@name_task)
      when !@boolean.nil?
        @hash_json.store('complete',@boolean)
      when !@position.nil?
        @hash_json.store('position',@position)
    end
    return @hash_json
  end

  end
