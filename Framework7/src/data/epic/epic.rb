require_relative '../base_class_for_data_classes'

class Epic < BaseClassForDataClasses
  attr_accessor :id,
                :name,
                :plan,
                :status,
                :created_at,
                :updated_at,
                :kind,
                :days_left,
                :project_id,
                :label,
                :url

  BOOLEAN_VALUES={'true'=>true,'false'=>false}

  def initialize(values = {})
    super(values)

  end

  def field_valid(field, value)
    case
      when field=='kind'
        KIND_VALUES.include?(value)
      when field=='name'
        value.kind_of?(String) && value.length > 0
      when field=='id'
        value.kind_of?(Integer) && value > 0
      when field=='plan'
        PLAN_VALUES.include?(value) && value.length > 0
      when field=='status'
        STATUS_VALUES.include?(value) && value.length > 0
      when field=='created_at'
        value.kind_of?(String) && value.length > 0 && /^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$/.match(value)
      when field=='updated_at'
        value.kind_of?(String) && value.length > 0 && /^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$/.match(value)
      when field=='days_left'
        value.kind_of?(Integer)
      when field=='project_id'
        value.kind_of?(Integer)
      when field=='url'
        value.kind_of?(String)
      when field=='label'
        validate_status=true
        value.each_pair do |key,value|
          validate_status= field_valid(key,value) && validate_status
        end
        validate_status
      else
        puts '%s field was not found' %field
    end
  end

end