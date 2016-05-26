require_relative 'base_class_for_data_classes'

class TaskDetails < BaseClassForDataClasses
  attr_accessor :kind_task,
                :id_project,
                :story_id,
                :description_task,
                :complete_task,
                :position_task,
                :created_at,
                :updated_at

  def initialize(values = {})
    super(values)
  end

end
