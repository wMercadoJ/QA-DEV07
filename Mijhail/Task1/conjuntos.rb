class Conjunto

  def union(primero_array, segundo_array)
    result= Array.new (segundo_array)
    primero_array.each { |index|
      unless exit? index, segundo_array
        result.push(index)
      end
    }
    result
  end

  def exit?(value, other_array)

    other_array.each { |index|
      if index==value
        return true
      end
    }
    false
  end
  def interseccion (primer_array, segundo_array)
    result= Array.new
    iterate_array =primer_array.size >segundo_array.size ? primer_array : segundo_array
    iterate_array.each { |value|
      if (exit?value,primer_array) && (exit?value, segundo_array)
        result.push(value)
      end
    }
    result

  end

  def diference (primer_array, segundo_array)
    result= Array.new

    primer_array.each { |value|
      unless exit? value, segundo_array
        result.push(value)
      end
    }
    result

  end

  def diference_simetrica (primer_array, segundo_array)
    result= Array.new
    intesections = interseccion primer_array, segundo_array
    primer_array.each { |value|
      # noinspection RubyParenthesesAroundConditionInspection
      unless exit? value, intesections
        result.push(value)
      end
    }
    segundo_array.each { |value|
      result.push(value) unless exit? value, intesections


    }
    result

  end

  def complemento (primer_array, segundo_array)
    result= Array.new
    iterate_array =primer_array.size >segundo_array.size ? primer_array : segundo_array
    iterate_array.each { |value|
      result.push(value) if exit? value, segundo_array
    }
    result

  end

  def cartesian_product (primer_array, segundo_array)
    result= Array.new
    primer_array.each { |value|
      segundo_array.each { |item|
        items= Array.new
        items.push(value)
        items.push(item)
        result.push(items)
      }

    }
    result
  end
end

conjunto = Conjunto.new
p conjunto.union %w(python ruby java), %w(Pedro juan java)
p conjunto.interseccion %w(python ruby java lolo), %w(Pedro juan java)
p conjunto.diference %w(python ruby java lolo), %w(Pedro juan java)
p conjunto.diference_simetrica %w(python ruby java lolo), %w(Pedro juan java)
p conjunto.complemento [0,1,2,3,4,5,6,7,8,9], [1,3,5,9]
p conjunto.cartesian_product [1, 2, 3, 4], %w(a b c)