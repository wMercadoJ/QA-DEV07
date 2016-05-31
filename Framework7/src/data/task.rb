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
                @hash = Hash.new
  def initialize(values = {})
    super(values)
  end

  def to_hash
    @hash = self.instance_variables.each_with_object({}){|var, hash| hash[var.to_s.delete('@')] = self.instance_variable_get(var)}
  end

end
