require_relative '../../../src/requests/account/account_get'
require_relative '../../../src/data/account/account'
require_relative '../../../src/helpers/rest_client/api_rest_client'


Given(/^I have an (?:.*?) with id (\d+)$/) do |id_account|
  @id_account=id_account
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
  expect(@account_object).to eq(JSON.parse(json_expected))
end

Then(/^The accounts? should have the nex attributes?:$/) do |attribute_types|
  attribute_hash=Hash.new
  attribute_types.hashes.each_with_object({}) do |row|
    attribute_hash[row['attribute']]= row['type']
  end

  if   @account_object.kind_of?(Array) then
    @account_object.length.times do |index|
      validate_attribute_types(@account_object[index],attribute_hash)
    end

  else

    if @account_object.kind_of?(Array) then
        @account_object.length.times do |index|
        validate_attribute_types(@account_object[index],attribute_hash)
      end

    else
      validate_attribute_types(@account_object,attribute_hash)
    end
  end
end
#when i implemented the next method on AccountGet class i get the next error:
#undefined method `expect' for AccountGet:Class (NoMethodError)
# how should implemen this method on AccountGet class?
def validate_attribute_types(account,attribute_type)

  expect(account['kind']).to be_a_kind_of(Object.const_get(attribute_type['kind']))
  expect(account['id']).to be_a_kind_of(Object.const_get(attribute_type['id']))
  expect(account['id']).to be >= 0
  expect(account['name']).to be_a_kind_of(Object.const_get(attribute_type['name']))
  expect(account['name']).to_not be_empty
  expect(account['plan']).to be_a_kind_of(Object.const_get(attribute_type['plan']))
  expect(account['plan']).to_not be_empty
  expect(account['status']).to be_a_kind_of(Object.const_get(attribute_type['status']))
  expect(account['status']).to_not be_empty
  expect(account['created_at']).to match(/^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$/)
  expect(account['created_at']).to_not be_empty
  expect(account['updated_at']).to match(/^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$/)
  expect(account['updated_at']).to_not be_empty

end
