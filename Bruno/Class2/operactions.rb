class Operations

    def initialize
      @firstArray=Array.new
      @secondArray=Array.new
      @unionArray=Array.new
      @intersectionArray=Array.new
      @deferenceArray=Array.new
      @simetricDeferenceArray=Array.new
      @stringArray=Array.new
      @cartesianProduct=Array.new
      @complement=Array.new
    end
    def insertingDataToFirstArray
      puts 'Insert the length of the first array'
      length=gets.chomp.to_i
      for i in 1..length
        puts "insert number #{i}"
        number=gets.chomp
        @firstArray.push(number)
      end
    end
    def insertingDataToSecondArray
      puts 'Insert the length of the second array'
      length=gets.chomp.to_i
      for i in 1..length
        puts "insert number #{i}"
        data=gets.chomp
        @secondArray.push(data)
      end
    end
    def insertingStringData
      puts 'Insert the length of the array of strings'
      length=gets.chomp.to_i
      for i in 1..length
        puts "insert number #{i}"
        data=gets.chomp.to_s
        @stringArray.push(data)
      end
    end
    def union
      for i1 in 0..(@firstArray.length-1)
        @unionArray.push(@firstArray[i1])
      end
      for i2 in 0..(@secondArray.length-1)
        @unionArray.push(@secondArray[i2])
      end
    end

    def intersection
      for i1 in 0..(@firstArray.length-1)
        for i2 in 0..(@secondArray.length-1)
          if (@firstArray[i1]==@secondArray[i2]) then
            @intersectionArray.push(@firstArray[i1])
          end
        end
      end
    end
    def deference
      for i1 in 0..(@firstArray.length-1)
        @deferenceArray.push(@firstArray[i1])
      end
      for i1 in 0..(@firstArray.length-1)
        for i2 in 0..(@secondArray.length-1)
          if @firstArray[i1]==@secondArray[i2]
            @deferenceArray.delete(@firstArray[i1])
          end
        end
      end
    end
    def simetricDiference
      for i in 0..(@unionArray.length-1)
        @simetricDeferenceArray.push(@unionArray[i])
      end
      for i1 in 0..(@firstArray.length-1)
        for i2 in 0..(@secondArray.length-1)
          if @firstArray[i1]==@secondArray[i2]
            @simetricDeferenceArray.delete(@firstArray[i1])
          end
        end
      end
    end
    def cartesianProduct
      for  i1 in 0..(@firstArray.length-1)
        for i2 in 0..(@stringArray.length-1)
          data="(#{@firstArray[i1].to_s}, #{@stringArray[i2]})"
          @cartesianProduct.push(data)
        end
      end
    end
    def complement
      for i in 0..(@firstArray.length-1)
        @complement.push(@firstArray[i])
      end
      for i1 in 0..(@firstArray.length-1)
        for i2 in 0..(@secondArray.length-1)
          if @firstArray[i1]==@secondArray[i2]
            @complement.delete(@firstArray[i1])
          end
        end
      end
    end
    def printingArrays
      puts 'First array is:'
      puts @firstArray.inspect
      puts 'Second array is:'
      puts @secondArray.inspect
      puts 'Array of String is:'
      puts @stringArray.inspect
      puts 'union'
      puts @unionArray.inspect
      puts 'intersection'
      puts @intersectionArray.inspect
      puts 'deference'
      puts @deferenceArray.inspect
      puts 'Simetric Deference'
      puts @simetricDeferenceArray.inspect
      puts "Cartesian product"
      puts @cartesianProduct.inspect
      puts 'Conplement'
      puts @complement.inspect
    end
  end

  array=Operations.new
  array.insertingDataToFirstArray
  array.insertingDataToSecondArray
  array.insertingStringData
  array.union
  array.intersection
  array.deference
  array.simetricDiference
  array.cartesianProduct
  array.complement
  array.printingArrays