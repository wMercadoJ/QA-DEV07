class Operation

  attr_accessor :primes
  attr_accessor :pairs

  def initialize
    @primes = [2,3,5,7]
    @pairs = [2,4,6,8,10]
  end

  def union(a,b)
    union = []
    a.each do |n|
      union.push(n)
    end
    b.each do |n|
      if !(a.include?(n)) then
      union.push(n)
      end
    end
    puts "union : #{union.sort()}"
  end
  def intersection(a,b)
    intersection = []
    a.each do |i|
      b.each do |n|
        if (a.include?(n) and b.include?(i)) then
          intersection.push(n)
        end
      end
    end
    puts "intersection : #{intersection.sort()}"
  end
end

operation = Operation.new
operation.union(operation.primes,operation.pairs)
operation.intersection(operation.primes,operation.pairs)