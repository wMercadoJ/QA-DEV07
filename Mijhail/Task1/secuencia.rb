  def primtSecuence
    secuences= Array.new
    secuences[0]=1
    ant2 =1
    ant1 =1
    actual=1
    (1..21).each { |i|
      secuences.push(actual)
      actual = ant1 + ant2
      ant2 = ant1
      ant1 = actual
    }
    secuences
  end
p primtSecuence