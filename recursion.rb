# def recursion(n)
#   if n == 1
#     return 1
#   else
#     return n * recursion(n - 1)
#   end
# end

# # p recursion(3)

# def palindrome(string)
#   if string.length == 1 || string.length == 2
#     return true
#   if string[0] == string[-1]
#     palindrome(string[1..-2]) # remove first and last chars in the string
#   else
#     false
#   end
#   # if the string is one character, its a P
#   # else... check the first letter and the last letter
#   # if those are the same check second letter and second to last letter
#   # keep going if letters are the same; else it is not a P
# end

# def beer_wall(n)
#   if n == 0
#     print "no more bottles of beer on the wall."
#     return
#   else
#     print "#{n} bottles of beer on the wall."
#     beer_wall(n - 1)
#   end
# end


def fib(n)
  if n == 0
    0
  elsif n == 1
    1
  else
    fib(n-1) + fib(n-2)
  end
end

def flat_arr(n, set = [])
  # create a blank array ; pass elements of 'n' to blank array ; if it is an array,
  # send each individual element of that array to blank array
  # if there are no more elements in 'n', return

  n.each do |element|
    if element.class != Array
      set << element
    elsif element.class == Array
      flat_arr(element, set)
    end
  end
  return set

end
# Define a recursive function that flattens an array. 
# The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and
# [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].

def to_roman(roman_mapping, x, result = [])
  # if x == 0 
  #   return 0
  # else
  #   roman_mapping.keys.each do |key|
  #     if x % key == 0
  #       quotient = (x / key)
  #       quotient.times {result << roman_mapping[key]}
  #       return result.join('')
  #     elsif (x % key) < x # (6 % 5) < 6
  #       mod = (x % key) # mod = (6 % 5)
  #       mod.times {result << roman_mapping[key]}
  #       to_roman(roman_mapping, mod, result)
  #     else
  #       next
  #     end
  #   end
  # end
  if x == 0
    return result
  end
  roman_mapping.keys.each do |key|
    quotient, mod = x.divmod(key)
    quotient.times {result << roman_mapping[key]}
    return to_roman(roman_mapping, mod, result) if quotient > 0
  end

  result

end

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

# puts to_roman(roman_mapping, 99).join('')



def from_roman(roman_symbols, string, number = 0)
  if string == ''
    return number
  end

  roman_symbols.keys.each do |key|
    if string.start_with?(key)
      number = number + roman_symbols[key]
      string.slice!(key)
      return from_roman(roman_symbols, string, number) if string.length > 0
    end
  end

  number
end

roman_symbols = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

puts from_roman(roman_symbols, "XLIX")