class SequenceUnion
	attr_accessor:elementsToPrint
	attr_accessor:arraySequence
	def initialize
		@elementsToPrint=200
		@arraySequence=Array.new
	end
	def print_prime_palindromic_numbers
		prime=1

		for numPrimos in (1..elementsToPrint)
			
			if is_prime?(numPrimos)
				if is_palindromic?(numPrimos)
					arraySequence.push prime	
				end
			end
		prime+=1		
		end
	end
	def is_prime?(value)
		isPrime=true
		for divisor in (2..value-1)
			if value%divisor==0
				isPrime=false
			end
		end
		return isPrime
	end
	def is_palindromic?(value)
		reversePrimeNumber=Array.new
		primeNumber=value.to_s.split(//)

		if primeNumber.length<2
			return true
		end
		while primeNumber.length>0
				reversePrimeNumber.push((primeNumber.pop))	
		end
		if reversePrimeNumber.to_s==value.to_s.split(//).to_s
			return true
		else
			return false
		end
	end
	
end
primo= SequenceUnion.new
primo.print_prime_palindromic_numbers
p primo.arraySequence