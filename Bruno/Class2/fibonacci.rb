class Secuence_1
  @lengthOfSecuence
  @secuenceArray
  def initialize(secuenceLimit)
    @lenghtOfSecuence=secuenceLimit.to_i
    @secuenceArray=Array.new
  end
  #This Method store the numbers of the secuence into an array
  def secuence_of_numbers
    number1=1
    number2=0
    @lenghtOfSecuence.times do
     number3=number1+number2
     @secuenceArray.push(number3)
     number1=number2
     number2=number3
    end
  end
  #This method will print the secuence array
  def print_secuence
    p 'The Fibonacci secuence is:'
    puts @secuenceArray.inspect
  end
end

secuence=Secuence_1.new(10)
secuence.secuence_of_numbers
secuence.print_secuence



