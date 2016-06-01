require_relative '../data/workspace_get'
require 'json'

class WorkspaceValid
  def self.call_and_return_response(client)
    url_elements = %w/
      my
      workspaces
    /

    status_code, response_body = client.get(url_elements)

    jsonArray = response_body
    objArray = JSON.parse(jsonArray)

    @hashArray = Array.new()

    objArray.each do |object|

      @hashArray.push(WorkspaceGet.new(object).to_hash)

    end

    #[status_code, workspace_get]
    [status_code, @hashArray]
  end

  def self.validate_workspace_details(client)

    status_code, workspace_get = self.call_and_return_response(client)

   # puts "status_code #{status_code}"
   # puts "workspaces #{workspace_get}"

     # Validations

    ((self.validate_workspace_values(workspace_get)) == (true)) ? (p "Valid json") : (p "Invalid json")

  end

    def self.validate_workspace_values(workspace_get)
      workspace_get_values = workspace_get

      @failsArray = Array.new

      workspace_get_values.each do |objectHash|

        (!(self.myKind(objectHash['kind'])))?(@failsArray.push(objectHash['kind'])):()
        (!(self.myIdWorkspace(objectHash['id'])))?(@failsArray.push(objectHash['id'])):()
        (!(self.myNameWorkSpace(objectHash['name'])))?(@failsArray.push(objectHash['name'])):()
        (!(self.myPersonId(objectHash['person_id'])))?(@failsArray.push(objectHash['person_id'])):()
        (!(self.myProjectsIds(objectHash['project_ids'])))?(@failsArray.push(objectHash['project_ids'])):()

         end
    end

  def self.myKind(kind)

    (/[a-zA-Z0-9]/.match(kind))?(return true):(return false)

  end

  def self.myIdWorkspace(id)

    (/[a-zA-Z0-9]/.match(id))?(return true):(return false)

  end

  def self.myNameWorkSpace(name)

    (/[a-zA-Z0-9]/.match(name))?(return true):(return false)

  end

  def self.myPersonId(person_id)

    (/[a-zA-Z0-9]/.match(person_id))?(return true):(return false)

  end

  def self.myProjectsIds(project_id)

    (/[a-zA-Z0-9]/.match(project_id))?(return true):(return false)

  end

  end
