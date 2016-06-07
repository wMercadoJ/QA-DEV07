Before('@smoke_test','@functional_test','@negative_test') do |scenario|
  puts "Scenario: #{scenario.name}"

end
After('@smoke_test','@functional_test','@negative_test') do |scenario|
  if scenario.failed?
    puts  "Failed #{scenario.exception.message}"
  else
    puts "Scenario: #{scenario.status}"
  end

end
Before('@smoke_test','@functional_test','@negative_test') do |scenario|
  puts "Scenario: #{scenario.name}"
end

After('@smoke_test','@functional_test','@negative_test') do |scenario|
  if scenario.failed?
    puts  "Failed #{scenario.exception.message}"
  else
    puts "Scenario: #{scenario.status}"
  end
end