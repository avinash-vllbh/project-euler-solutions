# Special Pythagorean triplet
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

include Math
require 'pry'

class PythagoreanTriplet
  # Used Dickson Method for generating pythagorean triplets
  def dicksonMethod(limit)
    if (Integer(limit) rescue false)
      flag = false
      (1..limit).each do |x|
        r = 2*x
        product = r*r/2
        factors = getFactors(product)
        factors.each do |s,t|
          a = r+s # 1st side of a right triangle 
          b = r+t # 2nd side of a right triangle
          c = r+s+t # 3rd side of a right triangle
          if a+b+c == limit
            flag = true
            puts "PythagoreanTriplet is: [#{a}, #{b}, #{c}]"
            puts "product of triplet is: #{a*b*c}"
          end
        end
        break if flag # Break if flag is set to true when a matching triplet is found
      end
    else
      puts ArgumentError.new("Need a valid integer as input")
    end
  end

  # Generate possible factors for a number
  # We need to check only until floor(sqrt(number)), as atleast on of the factors will be less than or equal to square root of that number
  def getFactors(product)
    factors = []
    limit = Math.sqrt(product).floor
    for i in 1..limit
      if product%i == 0
        factors.push([i,product/i])
      end
    end
    return factors
  end
end

test = PythagoreanTriplet.new
test.dicksonMethod(1000)