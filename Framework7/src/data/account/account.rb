require_relative '../base_class_for_data_classes'

class Account < BaseClassForDataClasses
  attr_accessor :id,
                :name,
                :plan,
                :status,
                :created_at,
                :updated_at,
                :kind,
                :days_left

  @hash=Hash.new
  def initialize(values = {})
    super(values)

  end
  def to_hash
    @hash = self.instance_variables.each_with_object({}) { |var, hash|
      hash[var.to_s.delete('@')] = self.instance_variable_get(var)
    }
  end

end