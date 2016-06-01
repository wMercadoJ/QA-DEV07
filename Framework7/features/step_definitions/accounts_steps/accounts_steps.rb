require_relative '../../../src/requests/account/account_get'
require_relative '../../../src/data/account/account'
require_relative '../../../src/helpers/rest_client/api_rest_client'


Given(/^I have an (?:.*?) with id (\d+)$/) do |id_account|
  @id_account=id_account
end

Given(/^I have a set of accounts$/) do

end

When(/^I send a (:?GET|UPDATE) request to (.*) endpoint/) do |method,end_point|
  puts "Performing a #{method} request"
  id=  @id_account.nil? ? '':@id_account
  @status_code, @account_object = AccountGet.validate_endpoint(@client, end_point, id )
end

Then(/^I expect status code (\d+)$/) do |http_code|
  expect(@status_code.to_s).to eq(http_code.to_s)
end

Then(/^The response should be the next JSON:$/) do |json_expected|
  expect(@account_object.to_hash).to eq(JSON.parse(json_expected))
end

Then(/^I expect (true|false) as result of fields? validations?$/) do |is_validated|
  if @account_object.kind_of?(Array) then
    @account_object.length.times do |index|
      expect(@account_object[index].validate_field).to be is_validated.to_bool
    end
  else
    expect(@account_object.validate_field).to be is_validated.to_bool
  end
end


