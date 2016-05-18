class Number_Palindrome

  def is_prime?(number)
    (2...number).each { |count|
      aux= number % count
      if aux == 0
        return false
      end
    }
    true
  end

  def invert_number(number)
    invert_number= 0
    while number!=0
      resta= number %10
      invert_number= invert_number.to_i*10 + resta
      number=number / 10
    end
    invert_number

  end

  def number_palindrome(quantity)
    result = Array.new
    (1..quantity).each do |number|

      invert= invert_number number
      result.push(number) if (is_prime? number) && (number == invert)

    end
    result
  end
end



number = Number_Palindrome.new

p number.number_palindrome 200

