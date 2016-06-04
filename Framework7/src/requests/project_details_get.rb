require_relative '../../src/data/project_details'

class ProjectDetailsGet
  def self.call_and_return_response(client, url_end_point)
    url_elements = '/projects/1598453'
      #     %w/
      #   projects 1598453
      # /
    # [url_end_point, '1601011']

    p url_elements
    status_code, response_body = client.get(url_elements)
    project_details = ProjectDetails.new(response_body)
    project_details.validate_fields_symbol
    [status_code, project_details]
  end

  def self.validate_project_details(client, url_end_point)
    p url_end_point
    status_code,project_details = self.call_and_return_response(client, url_end_point)
   #  p project_details
     status_validation = project_details.validate_fields

    # Validations

  end

  def self.validate_id(id)
    if id.to_s =~ (/^[0-9]{7}$/)
      return true
    end
    false
  end
  def self.validate_name_project(name_project)
    name_project = name_project.to_s
    if name_project.kind_of?(String) && name_project.length <= 50
      return true
    end
    false
  end
  def self.validate_word_length(word, size)
    if word.to_s.length <= size.to_i and !word.to_s.nil?
      return true
    end
    false
  end

  def self.validate_word_type(word)
    if word.to_s.kind_of?(String)  and !word.to_s.nil?
      return true
    end
    return false
  end

  def self.validate_week_start_day(array, search)
  #  array = Array.new('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')
    if array.include?(search)
      return true
    end
    false
  end

  def self.validate_date(date)
    if date.to_s =~ (/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])T(0[0-9]|[1-5][0-9]):(0[0-9]|[1-5][0-9]):(0[0-9]|[1-5][0-9])Z$/)
      return true
    end
    false
  end

  def self.project_type(project_type)
    if project_type.to_s =~ (/^demo|private|public|shared$/)
      return true
    end
    false
  end
  def self.validate_boolean(type_boolean)
    if type_boolean.is_a?(TrueClass) || type_boolean.is_a?(FalseClass)
      return true
    end
    false
  end

  def self.validate_int(type_int)
    return true if type_int.kind_of?(Integer)
    false
  end

  def self.validate_time_zone(type_zone)
    type_zone.each_pair do |field, value|
      case
        when field == 'kind'
          value.equal?('time_zone')
        when field == 'olson_name'
          value.to_s =~ (/^[A-Z]([a-z])+\/[A-Z]([a-z])+_[A-Z]([a-z])+$/)
        when field == 'offset'
          value.to_s =~(/^(\+|\-)(0[1-9]|1[0-4]):(0[0-9]|[1-5][0-9])/)
        else
          puts '%s field was not found ' % field
          false
      end
    end
  end

end