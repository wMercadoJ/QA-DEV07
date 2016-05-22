class Exercises

  def initialize(max)
       @max=max
  end

  def count

    cont1 = 1
    cont2 = 1
    cadena = 1
    (1..(@max-1)).each {

      cadena = "#{cadena} - #{cont2.to_s}"
      aux = cont1
      cont1 = cont2
      cont2 = aux + cont2

    }
    puts cadena
  end

end


lanzador = Exercises.new(20)
lanzador.count