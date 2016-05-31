require_relative '../data/workspace_get'
require 'json'

class Workspace_Valid_Get
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

    ((self.validate_workspace_kind(workspace_get)) == (true)) ? (p "Valid name") : (p "Invalid name")

  end

    def self.validate_workspace_kind(workspace_get)
      workspace_get_kind = workspace_get
      workspace_get_kind.each do |objectHash|

        myKind = objectHash['kind']
      #p myKind

        (/[a-zA-Z0-9]/.match(myKind))?(return true):(return false)

      end
    end

end