require_relative '../../../src/requests/account_get'

When(/^I send a GET request to the endpoint (\w+) with the id (\d+)$/) do |end_point, id|
  @status_code, @account = AccountGet.validate_endpoint(@client, end_point, id)
end

Then(/I expect that my account will be validated/) do
  expect(@status_code).to eql (200)
  expect(@account).to eql (Account.new)
end


