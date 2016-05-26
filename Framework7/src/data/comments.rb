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
    super(values)
  end
end