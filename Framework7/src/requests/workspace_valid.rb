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

    #((self.validate_workspace_values(workspace_get)) == (true)) ? (p "Valid json") : (p "Invalid json")

  end

    def self.validate_workspace_values(workspace_to_valid)
      workspace_values = workspace_to_valid

      failHash = Hash.new

      (!(self.myKind(workspace_values[:kind])))?(failHash[:kind] = 'false'):()
      (!(self.myIdWorkspace(workspace_values[:id])))?(failHash[:id] = 'false'):()
      (!(self.myNameWorkSpace(workspace_values[:name])))?(failHash[:name] = 'false'):()
      (!(self.myPersonId(workspace_values[:person_id])))?(failHash[:person_id] = 'false'):()
      (!(self.myProjectsIds(workspace_values[:project_ids])))?(failHash[:project_ids] = 'false'):()

    validate_hash_fail(failHash)
    end

  def self.validate_hash_fail(failHash)
    my_fails_hash = Hash.new(failHash)

     # if my_fails_array.empty?
     #   return true
     # else
     #   return false
     #   #envio de hash al reporte
     # end
my_fails_hash
  end

      def self.myKind(kind)

         (kind.kind_of?(String) && kind.length <= 25)?(return true):(return false)

      end

      def self.myIdWorkspace(id)

        (id.kind_of?(Integer) && id.to_s.length <= 7)?(return true):(return false)

      end

      def self.myNameWorkSpace(name)

        (name.kind_of?(String) && name.length <= 25)?(return true):(return false)

      end

      def self.myPersonId(person_id)

        (person_id.kind_of?(Integer) && person_id.to_s.length <= 7)?(return true):(return false)

      end

      def self.myProjectsIds(project_id)

        @flag = true
        project_id.each do |value|
        (value.kind_of?(Integer) && value.to_s.length <= 7)?(@flag = true):(@flag = false)
        end

        return @flag
      end

  end
