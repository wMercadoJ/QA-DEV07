require_relative 'base_class_for_data_classes'
require_relative '../requests/project_details_get'
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

  def field_valid(field, value)
    case
      when field == :kind

         KIND_VALUES.include?(value.to_s)
      when field == :name
#        Validate.is_integer(value, 50)
        ProjectDetailsGet.validate_word_length(value, 50)
      when field == :id
              ProjectDetailsGet.validate_id(value)
      when field == :version
               ProjectDetailsGet.validate_int(value)
      when field == :iteration_length
        ProjectDetailsGet.validate_int(value)
      when field == :week_start_day
               ProjectDetailsGet.validate_week_start_day(WEEK_DAY, value)
      when field == :point_scale
                ProjectDetailsGet.validate_word_type(value)
      when field == :point_scale_is_custom
              ProjectDetailsGet.validate_boolean(value)
      when field == :bugs_and_chores_are_estimatable
              ProjectDetailsGet.validate_boolean(value)
      when field == :automatic_planning
             ProjectDetailsGet.validate_boolean(value)
      when field == :enable_tasks
              ProjectDetailsGet.validate_boolean(value)
      when field == :time_zone
         ProjectDetailsGet.validate_time_zone(value)
      when field == :velocity_averaged_over
            ProjectDetailsGet.validate_int(value)
      when field == :number_of_done_iterations_to_show
            ProjectDetailsGet.validate_int(value)
      when field == :has_google_domain
             ProjectDetailsGet.validate_boolean(value)
      when field == :enable_incoming_emails
            ProjectDetailsGet.validate_boolean(value)
      when field == :public
            ProjectDetailsGet.validate_boolean(value)
      when field == :atom_enabled
            ProjectDetailsGet.validate_boolean(value)
      when field == :project_type
             ProjectDetailsGet.validate_word_type(value)
      when field == :start_time
             ProjectDetailsGet.validate_date(value)
      when field == :created_at
            ProjectDetailsGet.validate_date(value)
      when field == :updated_at
             ProjectDetailsGet.validate_date(value)
      when field == :account_id
            ProjectDetailsGet.validate_int(value)
      when field == :current_iteration_number
            ProjectDetailsGet.validate_int(value)
      when field == :initial_velocity
            ProjectDetailsGet.validate_int(value)
      when field == :enable_following
             ProjectDetailsGet.validate_boolean(value)


      else
        puts '%s field was not found ' % field
        false
    end

  end
end




