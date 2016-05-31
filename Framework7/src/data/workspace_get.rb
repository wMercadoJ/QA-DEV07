require_relative 'base_class_for_data_classes'

class WorkspaceGet < BaseClassForDataClasses
  attr_accessor :kind,
                :id,
                :name,
                :person_id,
                :project_ids

  def initialize(values = {})
    super(values)
  end

end
