module Base52 
  CHARS = ('a'..'z').to_a + ('A'..'Z').to_a
  NUMBER = 52

  def encode( numeric, offset=0 )
    raise ArgumentError unless Numeric === numeric
    numeric += offset

    return '0' if numeric == 0
    s = ''

    while numeric > 0
      s << CHARS[numeric.modulo(NUMBER)]
      numeric /= NUMBER
    end
    s.reverse
  end

  def decode( base52,offset=0 )
    s = base52.to_s.reverse.split('')

    total = 0
    s.each_with_index do |char, index|
      if ord = CHARS.index(char)
        total += ord * (NUMBER ** index)
      else
        raise ArgumentError, "#{base52} has #{char} which is not valid"
      end
    end
    total -= offset
  end

  module_function :encode, :decode
end
