require_relative 'base_class_for_data_classes'

class TaskDetails < BaseClassForDataClasses
  attr_accessor :complete,
                :created_at,
                :description,
                :id,
                :kind,
                :position,
                :story_id,
                :updated_at
                @type_value = ['task', 'story']
                @hash = Hash.new
  def initialize(values = {})
    super(values)
  end

  def to_hash
    @hash = self.instance_variables.each_with_object({}){|var, hash| hash[var.to_s.delete('@')] = self.instance_variable_get(var)}
  end

  def properties_task
    @properties = {:complete => 'string',
        :description => 'string',
        :id => 'Integer',
        :kind => 'string',
        :position => 'Integer',
        :story_id => 'Integer',
        :created_at => 'Date',
        :updated_at => 'Date'}
  end

  def field_valid(field, value)
    case
      when field == 'kind'
        @type_value.include?(value)
      when field == 'description'
        Validate.is_integer(value, 1000)
        value.kind_of?(String) && value.length < 1000
      else
        false
    end
  end


end
