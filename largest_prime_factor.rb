# Largest prime factor
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

require 'pry'

class LargestPrimeFactor
  attr_accessor :primes, :factors

  def initialize
    self.primes = [2] # All the primes calculated during execution would be stored to use for deciding if a number is prime or not
    self.factors = []
  end

  def largest_prime_factor(input)
    if (Integer(input) rescue false)
      loop do
        prime = primes.last
        while input % prime == 0
          self.factors.push(prime) # Add the divisor to the list of factors for input prime number
          input = input / prime
        end
        break unless input > next_prime_number
      end
      if input == primes.last
        self.factors.push(input)
      end
      return factors.max
    else
      ArgumentError.new("A valid integer is required as an input")
    end
  end

  private

  ##
  # Returns the next possible prime number
  ##
  def next_prime_number
    possible_prime = primes.max + 1 # Increasing by since, since increasing a prime by 1 would be be even number it's divisible by 2
    while true
      if check_composite(possible_prime)
        self.primes.push(possible_prime)
        break
      end
      possible_prime += 1
    end
    return possible_prime
  end

  ##
  # Returns true or false based on a number being composite or not
  # A number is composite if it's divisible by any other primes 
  ##
  def check_composite(number)
    is_prime = true
    primes.each do |prime|
      if number % prime == 0
        is_prime = false
        break
      end
    end
    return is_prime
  end
end

# lg_prime_factor = LargestPrimeFactor.new
# puts lg_prime_factor.largest_prime_factor(600851475143)