require_relative '../../data/account/account'
class AccountGet

  def self.call_and_return_response(client, endpoint, id)
    url_elements = [
        endpoint,
        id,
    ]
    status_code, response_body = client.get(url_elements)
    account = Account.new(response_body)
    [status_code, account]
  end

  def self.validate_endpoint(client, endpoint, id)
    status_code, account = self.call_and_return_response(client, endpoint, id)
    [status_code, account]

    # Validations
  end

end