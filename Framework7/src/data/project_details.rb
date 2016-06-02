require_relative 'base_class_for_data_classes'
class ProjectDetails < BaseClassForDataClasses
  attr_accessor :id,
                :kind,
                :name,
                :version,
                :iteration_length,
                :week_start_day,
                :point_scale,
                :point_scale_is_custom,
                :bugs_and_chores_are_estimatable,
                :automatic_planning,
                :enable_tasks,
                :time_zone,
                :velocity_averaged_over,
                :number_of_done_iterations_to_show,
                :has_google_domain,
                :enable_incoming_emails,
                :public,
                :atom_enabled,
                :project_type,
                :start_time,
                :created_at,
                :updated_at,
                :account_id,
                :current_iteration_number,
                :initial_velocity,
                :enable_following

  def initialize(values = {})
    super(values)
  end
end



