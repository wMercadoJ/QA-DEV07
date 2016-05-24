class Sets 
	attr_accessor:set1
	attr_accessor:set2
	def initialize
		@set1=Array.new
		@set2=Array.new
		fill_sets
	end
	def fill_sets
		@set1=['one','two','three','four','five','six','seven']
		@set2=['red', 'orange', 'yellow', 'green', 'blue', 'brown', 'violet']
	end
	def set_union
		if(@set1.length==@set2.length)
			unionArray=@set2
			@set1.each do |element|
				unionArray.push element
			end
		end
		p unionArray
	end
	def set_cartesian_product
		completeHash=Hash.new
		completeHash.compare_by_identity
		i=0
		while i<@set1.length
			j=0
			while j<@set2.length
				completeHash.store("#{@set1[i]}",@set2[j])
				j+=1
			end
			i+=1
		end
		p completeHash
		#p @set1.product(@set2)
	end
	
end

set=Sets.new
set.set_union
set.set_cartesian_product