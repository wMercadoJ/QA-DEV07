class Stories
  attr_accessor :project_id,
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
                :labels,
                :label_ids,
                :tasks,
                :follower_ids,
                :comments,
                :created_at,
                :before_id,
                :after_id,
                :integration_id,
                :external_id

  def initialize(values = {})

  end



end