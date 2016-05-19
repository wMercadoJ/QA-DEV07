def print_sequence
  sequence=Array.new
  limit=10
  i=0
  nex=1
  last=0
  while i<=limit
    result=nex+last
    sequence.push(result)
    if i!=0
      last=nex
      nex=result
    end
    i+=1
  end
  puts sequence
end

print_sequence
