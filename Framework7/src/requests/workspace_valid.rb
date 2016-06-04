require_relative '../data/workspace_get'
require 'json'

class WorkspaceValid
  def self.call_and_return_response(client)
    url_elements = %w/
      my
      workspaces
    /

    status_code, response_body = client.get(url_elements)

    json_array = response_body
    obj_array = JSON.parse(json_array)

    @hash_array = Array.new

    obj_array.each do |object|
      @hash_array.push(WorkspaceGet.new(object).to_hash)
    end
    [status_code, @hash_array]
  end

  def self.validate_workspace_values(workspace_to_valid)
    workspace_values = workspace_to_valid

    fail_hash = Hash.new

    (!(self.my_kind(workspace_values[:kind])))?(fail_hash[:kind] = 'false'):()
    (!(self.my_id_workspace(workspace_values[:id])))?(fail_hash[:id] = 'false'):()
    (!(self.my_name_workspace(workspace_values[:name])))?(fail_hash[:name] = 'false'):()
    (!(self.my_person_id(workspace_values[:person_id])))?(fail_hash[:person_id] = 'false'):()
    (!(self.my_projects_ids(workspace_values[:project_ids])))?(fail_hash[:project_ids] = 'false'):()

    validate_hash_fail(fail_hash)
  end

  def self.validate_hash_fail(fail_hash)
    my_fails_hash = Hash.new(fail_hash)
    return my_fails_hash
  end

  def self.my_kind(kind)

    (kind.kind_of?(String) && kind.length <= 25)?(return true):(return false)

  end

  def self.my_id_workspace(id)

    (id.kind_of?(Integer) && id.to_s.length <= 7)?(return true):(return false)

  end

  def self.my_name_workspace(name)

    (name.kind_of?(String) && name.length <= 25)?(return true):(return false)

  end

  def self.my_person_id(person_id)

    (person_id.kind_of?(Integer) && person_id.to_s.length <= 7)?(return true):(return false)

  end

  def self.my_projects_ids(project_id)

    @flag = true
    project_id.each do |value|
      (value.kind_of?(Integer) && value.to_s.length <= 7)?(@flag = true):(@flag = false)
    end
    return @flag
  end

end
