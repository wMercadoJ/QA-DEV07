class MyArrays

  def initialize
      @myArray1 = [2, 6, 8, 7, 1]
      @myArray2 = [3, 8, 9, 6]
  end

   def union

    myArrayResult = Array.new(@myArray2)

  @myArray1.each do |value|
     a=0
     @myArray2.each do |value2|

       if (value == value2) then a=a+1 end

     end
     if (a == 0) then myArrayResult.push(value) end
   end

    p myArrayResult.inspect


  end

def intersection

  myArrayResult = Array.new()

  @myArray1.each do |value|
  a=0

    @myArray2.each do |value2|

      if (value == value2) then a=a+1 end

    end

    if (a > 0) then myArrayResult.push(value) end
  end

  p myArrayResult.inspect

end


  def diffSimetrica

    myArrayResult = Array.new(@myArray2)

    @myArray1.each do |value|
      a=0
      @myArray2.each do |value2|

        if (value == value2) then a=a+1 end

      end
      if (a > 0) then myArrayResult.delete(value) end
      if (a == 0) then myArrayResult.push(value) end
    end

    p myArrayResult.inspect

  end


  def complement

    myArrayResult = Array.new(@myArray1)


   @myArray1.each do |value|
      a=0
       @myArray2.each do |value2|

        if (value == value2) then a=a+1 end

      end

      if (a > 0) then myArrayResult.delete(value) end

    end

    p myArrayResult.inspect

  end


  def prodCartesian

    myArrayResult = Array.new()


    @myArray1.each do |value|
      a=0
      @myArray2.each do |value2|

        myArrayResult.push("#{value.to_s},#{value2.to_s}")

      end

    end

    p myArrayResult

  end
end


resolve = MyArrays.new
resolve.union
resolve.intersection
resolve.diffSimetrica
resolve.complement
resolve.prodCartesian