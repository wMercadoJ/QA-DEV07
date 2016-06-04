Before('@epics') do |scenario|
  puts "Scenario: #{scenario.name}"

end
After('@epics', '@smoke_test') do |scenario|
  if scenario.failed?
    puts  "Failed #{scenario.exception.message}"
  else
    puts "Scenario: #{scenario.status}"
  end

end
Before('@accounts') do |scenario|
  puts "Scenario: #{scenario.name}"
end

After('@accounts','@smoke_test') do |scenario|
  if scenario.failed?
    puts  "Failed #{scenario.exception.message}"
  else
    puts "Scenario: #{scenario.status}"
  end
end