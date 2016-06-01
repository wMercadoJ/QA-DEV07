require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/comments'
require_relative '../../../src/requests/validate'


Given(/^I have set a connection to pivotal_tracker API service$/) do
  @client = ApiRestClient.new
end
When(/^I send a GET request to (\/projects\/1596603\/stories\/120320037\/comments)$/) do |end_point|
  @end_point = end_point.length
  @validate = Validate.new
  @status_request, @json = @validate.converting_to_json(@client.get(end_point))
end
When(/^I send a GET request to (\/projects\/1596603\/stories\/120320037\/comments\/135075719)$/) do |end_point|

  @end_point = end_point.length
  @status_request, @json = @client.get(end_point)
end
Then(/^I expect Status code (\d+)$/) do |status|
  expect(status.to_i).to eql(@status_request)
end


And(/^I receive (\w+)  of a comment$/) do |integer_value|
  @individual_json = Comments.new(@json)
    case integer_value
      when 'id'
        @answer_integer = @individual_json.validate_id_parameter
      when 'person_id'
        @answer_integer = @individual_json.validate_person_id_parameter
      when 'story_id'
        @answer_integer = @individual_json.validate_story_id_parameter
    end
end

And(/^I validate this integer parameters$/) do
  if @answer_integer == true
     @answer_integer_final = true
  else
    @answer_integer_final = false
  end
end

Then(/^I should receive true as an answer for integer values$/) do
  expect(true).to eql(@answer_integer_final)
end

Then(/^I should receive true as answer$/) do

end

And(/^I validate that the json comment has (\d+) parameters$/) do |length_of_json|
  @answer = expect(@json.length).to eql(length_of_json.to_i)
end

Then(/^I should receive true as an answer$/) do

end


And(/^I receive (\w+) parameter of a comment$/) do |string_parameter|
#I am till working on this
  case string_parameter
    when 'kind'

      @individual_json
    when 'text'


  end

end


And(/^I validate that the parameter has a valid value$/) do

end

And(/^I validate that text comment has (\d+) characters$/) do |arg1|

end
