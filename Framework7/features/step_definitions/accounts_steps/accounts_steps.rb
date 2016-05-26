require_relative '../../../src/requests/account/account_get'
require_relative '../../../src/data/account/account'

Given(/^I have an account with id (\d+)$/) do |id_account|
  @id_account=id_account
end

When(/^I send a (:?GET|UPDATE) request to (.*) with the id$/) do |method,end_point|
  puts "Performing a #{method} request"
  @status_code, @account_object = AccountGet.validate_endpoint(@client, end_point, @id_account)
end

Then(/^I expect status code (\d+)$/) do |http_code|
  expect(@status_code.to_s).to eq(http_code.to_s)
end

Then(/^The response should be the next JSON:$/) do |json_expected|
  json_account=JSON.parse(@account_object.to_hash.to_json)
  expect(json_account).to eq(JSON.parse(json_expected))
end

