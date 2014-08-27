# Smallest multiple
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
require 'pry'
require 'benchmark'
include Math
class SmallestMultiple
  attr_accessor :primes, :composites, :euler_primes

  def initialize
    self.primes = [3,2]
    self.euler_primes = [3,2]
    self.composites = []
  end

  def ruby_way(input)
    (1..input).reduce(:lcm)
  end

  def get_smallest_multiple(input)
    primes_composites(input)
    is_smallest_multiple = false
    counter = 2
    smallest_multiple = 0
    loop do
      smallest_multiple = input*counter
      if(is_divisible_primes(smallest_multiple))
        if(is_divisible_composites(smallest_multiple))
          is_smallest_multiple = true
          break
        end
      end
      counter += 1
      break if is_smallest_multiple
    end
    # p smallest_multiple
  end

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

  def is_divisible_primes(number)
    primes.each do |prime|
      unless number%prime == 0
        return false # If not divisible by even a single prime then break
      end
    end
    return true
  end

  def is_divisible_composites(number)
    composites.each do |composite|
      unless number%composite == 0
        return false # If not divisible by even a single prime then break
      end
    end
    return true
  end
  # To make the primes array between 2 and input
  def primes_composites(input)
    for i in 4..input
      is_prime = true
      primes.each do |prime|
        if i%prime == 0
          is_prime = false
          break
        end
      end
      if is_prime
        self.primes.unshift(i)
      else
        self.composites.unshift(i)
      end
    end
  end

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
        self.euler_primes.unshift(i)
      end
    end
  end
end

dividend = SmallestMultiple.new
iterations = 10
Benchmark.bm(40) do |bm|
  bm.report('ruby way of finding LCM') do
    iterations.times do
      dividend.ruby_way(20)
    end
  end
  bm.report('Project Euler way of finding LCM ') do
    iterations.times do
      dividend.euler_approach_sm(20)
    end
  end
  bm.report('My crappy way of doing LCM :( ') do
    dividend.get_smallest_multiple(20)
  end
end