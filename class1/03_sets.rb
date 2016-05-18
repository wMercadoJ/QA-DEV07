class Sets 
	attr_accessor:set1
	attr_accessor:set2
	def initialize
		@set1=Array.new
		@set2=Array.new
		fill_sets
	end
	def fill_sets
		@set1=['uno','dos','tres','cuatro','cinco','seis','siete']
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
		@set1.each do |element|
			
			@set2.each do|innerElement| 
				
				completeHash.store(element, innerElement)
			end
		end
		#p completeHash	
		p @set1.product(@set2)
	end
	
end

set=Sets.new
set.set_cartesian_product