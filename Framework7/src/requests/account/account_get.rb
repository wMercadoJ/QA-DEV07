require_relative '../../data/account/account'

class AccountGet

  def self.get_accounts(client, endpoint)
    url_elements = [
        endpoint,
    ]
    status_code, response_body = client.get(url_elements)
    accounts_array=Array.new

    JSON.parse(response_body).each_with_index do |key|
      accounts_array.push(Account.new(key).to_hash)
    end
    [status_code, accounts_array]
  end
  def self.get_account_by_id(client, endpoint, id)
    url_elements = [
        endpoint,
        id,
    ]

    status_code, response_body = client.get(url_elements)
    account = Account.new(response_body).to_hash
    [status_code, account]
  end
  def self.validate_endpoint(client, endpoint, id='')

    status_code, account = id==''? self.get_accounts(client, endpoint): self.get_account_by_id(client, endpoint, id)
    [status_code, account]

    # Validations
  end

end