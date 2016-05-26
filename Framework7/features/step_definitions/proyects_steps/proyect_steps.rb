require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/proyect_details'




And(/^I expect JSON for the Item equal to$/) do
  me_details = ProyectDetails.new(@response)
  expect(me_details).to eql (ProyectDetails.new)
end

Then(/^I expect Status the proyects code (\d+)$/) do |http_code|
  expect(@status_code.to_s).to eql(http_code.to_s)
end

And(/^I expects proyec Details Object$/) do
  me_details = ProyectDetails.new(@response)
  expect(me_details).to eql (ProyectDetails.new)
end

When(/^I send a GET request the proyects to (\/projects\/.*)$/) do |end_point|

  @status_code, @response = @client.get(end_point)
end

Given(/^I have set a connection proyect to pivotal_tracker API service$/) do
  @client = ApiRestClient.new
end

When(/^I send a POST request to (\/\D+) with json$/) do |end_point, text|
 text = { :name => "Konata Izumi" }
  @status_code, @response = @client.post(end_point, [],text)
end