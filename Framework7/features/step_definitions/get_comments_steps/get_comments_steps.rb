require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/comments'
<<<<<<< HEAD
#require_relative '../../../src/requests/validate'
=======
require_relative '../../../src/helpers/validate'
>>>>>>> 6413287b0981dda2a87fee5f42f81a09f5c3cbbf

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


And(/^I validate (\w+) parameter of a comment$/) do |integer_value|
  @individual_json = Comments.new(@json)
  case integer_value
    when 'id'
      @answer_integer = @individual_json.validate_id_parameter
    when 'person_id'
      @answer_integer = @individual_json.validate_person_id_parameter
    when 'story_id'
      @answer_integer = @individual_json.validate_story_id_parameter
    when 'kind'
      @answer_string_parameter = @individual_json.validate_kind_parameter
    when 'text'
      @answer_string_parameter = @individual_json.validate_text_parameter
    when 'created_at'
      @answer_date_parameter = @individual_json.validate_date_parameter(:created_at)
    when 'updated_at'
      @answer_date_parameter = @individual_json.validate_date_parameter(:updated_at)
    else
      break
  end
end

And(/^I validate this integer parameters$/) do
  if @answer_integer == true
    @answer_integer_final = true
  else
    @answer_integer_final = false
  end
end

And(/^I validate that the json comment has (\d+) parameters$/) do |length_of_json|
  @answer = expect(@json.length).to eql(length_of_json.to_i)
end

Then(/^I should receive true as an answer when the json has 7 numbers$/) do
  expect(true).to eql(@answer)
end

And(/^I validate that text comment has between (\d+) and (\d+) characters$/) do |minimum_limit, maximum_limit|
  @individual_json = Comments.new(@json)
  @answer_text_length= @individual_json.validate_length_text_parameter(minimum_limit.to_i, maximum_limit.to_i)
end

Then(/^I should receive true as an answer for (\w+) values/) do |type_of_answer|
  case type_of_answer
    when 'integer'
      expect(true).to eql(@answer_integer_final)
    when 'string'
      expect(true).to eql(@answer_string_parameter)
    when 'text_length'
      expect(true).to eql(@answer_text_length)
    when 'created_at'
      expect(true).to eql(@answer_date_parameter)
    when 'updated_at'
      expect(true).to eql(@answer_date_parameter)
    else
      break
  end
end


When(/^I send a GET request to (\/projects\/1596603\/stories\/120320037\/comments\/135075719)$/) do
  
end

Then(/^I expect bad request (\d+)$/) do |arg1|

end


