require_relative '../data/workspace_get'
require 'json'

class WorkspaceGet_Get
  def self.call_and_return_response(client)
    url_elements = %w/
      my
      workspaces
    /
    status_code, response_body = client.get(url_elements)


# es un string?
        p response_body.kind_of(String)

    #Intento convertir el string a un array?
    # pero igual despues tengo problemas

  #cambio = response_body.gsub(/(^\[)|(\]$)/,'')

        p cambio2 =  cambio.split(/{/)
        p cambio2[0]
        p JSON.parse(cambio2[0])

    response_body.each do |workspaceHash|
      p workspaceHash
    workspace_get = WorkspaceGet.new(workspaceHash)

      [status_code, workspace_get]

    end


  end

  def self.validate_me_details(client)

    status_code, workspace_get = self.call_and_return_response(client)

    p status_code
    p workspace_get

    # Validations
  end
end