# Smallest multiple
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
require 'pry'
require 'benchmark'
include Math
class SmallestMultiple
  attr_accessor :euler_primes

  def initialize
    self.euler_primes = [3,2]
  end

  # Inbuild ruby method uses LCM(a,b) = a*b/GCD(a,b) to find the smallest multiple quicker
  # Time complexity - O(n)
  # Space complexity - O(n)
  def get_smallest_multiple(input)
    (1..input).reduce(:lcm)
  end

  # Time complexity - O(n) [although actual time taken is larger than the above method]
  # Space complexity - O(n)
  def euler_approach_sm(input)
    fill_primes(input)
    limit = Math.sqrt(input)
    smallest_multiple = 1
    euler_primes.each do |prime|
      if prime <= limit
        power = (Math.log(input)/Math.log(prime)).floor
        smallest_multiple = smallest_multiple * (prime**power)
      else
        smallest_multiple = smallest_multiple * prime
      end
    end
    # puts smallest_multiple
  end

  private

  def fill_primes(input)
    for i in 4..input
      is_prime = true
      euler_primes.each do |prime|
        if i%prime == 0
          is_prime = false
          break
        end
      end
      if is_prime
        self.euler_primes.push(i)
      end
    end
  end
end

lcm = SmallestMultiple.new
iterations = 10000

# according to Benchmark results using the ruby method for finding LCM is much faster that the one given by Project Euler
Benchmark.bm(40) do |bm|
  bm.report('ruby way of finding LCM') do
    iterations.times do
      lcm.get_smallest_multiple(20)
    end
  end
  bm.report('Project Euler way of finding LCM ') do
    iterations.times do
      lcm.euler_approach_sm(20)
    end
  end
end