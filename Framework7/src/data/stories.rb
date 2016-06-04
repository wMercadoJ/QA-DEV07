require_relative 'base_class_for_data_classes'
class Stories < BaseClassForDataClasses
  attr_accessor :id,
                :project_id,
                :name,
                :description,
                :story_type,
                :current_state,
                :estimate,
                :accepted_at,
                :deadline,
                :requested_by_id,
                :owned_by_id,
                :owner_ids,
                :label_ids,
                :labels,
                :task_ids,
                :follower_ids,
                :comment_ids,
                :created_at,
                :updated_at,
                :before_id,
                :after_id,
                :integration_id,
                :external_id,
                :url,
                :transitions,
                :cycle_time_details,
                :kind

  def initialize(values = {})
    super(values)
  end



end