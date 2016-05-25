class Palindromo
  attr_accessor :numbers
  def initialize(n)
    @numbers = n
  end
  def palindrome
    palindromes = []
    @numbers.times do |num|
      n = num + 1
      if is_palindrome(n)  and is_prime(n) then
          palindromes.push(n)
      end
    end
    puts"Palindrome numbers: #{palindromes}"
  end

  def is_palindrome(number)
      new_number = number.to_s
      puts new_number
    return (new_number.reverse) == (new_number)
  end

  def is_prime(number)
    prime = true
    for i in 2..(number / 2)
      if number % i == 0 then
        prime = false
      end
    end
    return prime
end
end

puts 'Give me the quantity of numbers in wich search the palindrome numbers:'
numbers = gets.chomp.to_i
palindrome1 = Palindromo.new(numbers)
palindrome1.palindrome