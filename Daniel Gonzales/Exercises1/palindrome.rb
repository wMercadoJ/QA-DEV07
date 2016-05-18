class Palindrome

  @myArray = Array.new

  def initialize(size)
    @size = size.to_i
  end

  def result

    for i in 1..@size
    if (primo(i)==true && palindro(i)==true) then print "#{i.to_s} " end
    end
  end


   def primo(num)
    a=0;
    if(num ==1) then
      return true
    else
    for i in 1..num
         if(num%i==0) then (a=a+1)end
    end

    (a != 2) ? (return false):(return true)
  end
end

  def palindro(num)

  result1=num.to_i
  num_inv = 0

    begin

      result2 = result1%10 #resto
      result1 = result1/10 #seguir dividiendo
      num_inv = num_inv*10 + result2;
    end while (result1!=0)

      (num_inv==num) ? (return true):(return false)
    end

end



resolve = Palindrome.new(400)
resolve.result