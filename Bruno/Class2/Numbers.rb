class Numbers
  def initialize(lengthOfSecuence)
    @lemgthOfSecuence=lengthOfSecuence
    @secuenceArray=Array.new
  end
  def printingSecuence
    numberOfSecuence=1
    @lemgthOfSecuence.times do |index|
      if (( primo(numberOfSecuence)==true) && (capicua(numberOfSecuence)==true)) then
        @secuenceArray.push(numberOfSecuence)
      end
      numberOfSecuence+=1
    end
    puts @secuenceArray.inspect
  end
  def primo(number)

    countPrimo=0
    count=1
    while (count<=number)
      if number%count==0 then
        countPrimo+=1
      end
      count+=1
    end
    if countPrimo<=2
      isPrimo=true
    else
      isPrimo=false
    end
    return isPrimo
  end
  def capicua(number)

    number2=number
    capicuaNumber=0
    while number>0
      auxiliarNumber=number%10
      capicuaNumber=capicuaNumber*10+auxiliarNumber
      number=number/10
    end
    if capicuaNumber==number2 then
      isCapicua=true
    else
      isCapicua=false
    end
    return isCapicua
  end

end

numbers=Numbers.new(1000)
numbers.printingSecuence
puts numbers.capicua(101)
puts numbers.primo(7)