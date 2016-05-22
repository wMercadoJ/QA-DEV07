class Secuencia
  attr_accessor :quantity_add
  attr_accessor :serie
  def initialize(n)
    @quantity_add = n
    @serie = []
  end

  def print_serie
    first = 1
    second = 1
    @serie.push(first, second)

        (@quantity_add-2).times do
          next_number = first + second
          @serie.push(next_number)
          first = second
          second = next_number
        end
    puts "serie: #{@serie}"
  end
end

puts "Give me the quantity of numbers to generate:"
numbers = gets.chomp.to_i
sec = Secuencia.new(numbers)
sec.print_serie