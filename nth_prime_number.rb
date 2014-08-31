# 10001st prime
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

require 'prime'
require 'benchmark'

class NthPrime

  def eratosthenes_primes(limit)
    count = 1
    nth_prime = 0
    # Uses EratosthenesGenerator as default generator
    # Returns all the prime numbers until the upperbound(if any) is reached
    # Prime.each(100) --> Iterates over all the primes below 100
    # Prime.each do |prime| --> Iterates over infinite set of primes until a break condition is reached
    Prime.each do |prime|
      nth_prime = prime
      count += 1
      break if count > limit
    end
    puts nth_prime
  end

  def trail_division(limit)
    count = 1
    nth_prime = 0
    for prime in Prime::TrialDivisionGenerator.new
      nth_prime = prime
      count += 1
      break if count > limit
    end
  end
end

prime = NthPrime.new
iterations = 1
# according to Benchmark results
# - Both Eratosthenes and TrailDivison seems to take same time for smaller upper bounds
# - For large upperbounds Eratosthenes seems to be much faster
Benchmark.bm(40) do |bm|
  bm.report('EratosthenesGenerator') do
    iterations.times do
      prime.eratosthenes_primes(10001)
    end
  end
  bm.report('TrialDivisionGenerator') do
    iterations.times do
      prime.trail_division(10001)
    end
  end
end