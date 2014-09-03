# Summation of primes
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
require 'prime'
class PrimeSummation
  ###
  # => uses EratosthenesGenerator for generating primes
  # => Time complexity O(n)
  # => Space complexity O(n)
  ###
  def sumPrimes(limit)
    if(Integer(limit) rescue false)
      sum = 0
      Prime.each do |prime|
        break if prime > limit
        sum += prime
      end
      return sum
    else
      return ArgumentError.new("Need a valid integer as input")
    end
  end
end
sum = PrimeSummation.new
puts sum.sumPrimes(2000000)