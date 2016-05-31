require_relative '../../src/data/project_details'

class MeDetailsGet
  def self.call_and_return_response(client)
    url_elements = %w/
      projects 1595901
    /
     url_elements
    status_code, response_body = client.get(url_elements)
    project_details = ProjectDetails.new(response_body)

    [status_code, project_details]
  end

  def self.validate_project_details(client)
    status_code, project_details = self.call_and_return_response(client)
     status_code
     project_details.id

  end

  def validate_id(id)
    if id.to_s =~ (/^[0-9]{7}$/)
      return true
    end
    false
  end
  def validate_name_roject(name_project)
    name_project = name_project.to_s
    if name_project.kind_of?(String) && name_project.length <= 50
      return true
    end
    false
  end

  def validate_week_strat_day(array, search)
    array = Array.new('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')
    if array.include?(search)
      return true
    end
    false
  end

  def validate_date(date)
    if date.to_s =~ (/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])T(0[0-9]|[1-5][0-9]):(0[0-9]|[1-5][0-9]):(0[0-9]|[1-5][0-9])Z$/)
      return true
    end
    false
  end

  def project_type(project_type)
    if project_type.to_s =~ (/^demo|private|public|shared$/)
      return true
    end
    false
  end
  def validate_boolen(type_booelan)
    if type_booelan.kind_of?(boolean)
      return true
    end
    false
  end

end