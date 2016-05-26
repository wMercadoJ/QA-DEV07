require_relative 'base_class_for_data_classes'

class Account < BaseClassForDataClasses
  attr_accessor :id,
                :name,
                :plan,
                :status,
                :days,
                :over_the_limit,
                :created_at,
                :updated_at,
                :project_ids,
                :kind

  def initialize(values = {})
    super(values)
  end
end