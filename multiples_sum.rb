# Problem 1 - Multiples of 3 and 5
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

class MultipleSum

  attr_accessor :sum, :top

  def initialize
    @sum = 0
    @top = 0
  end

  def sum_multiples(params = {})
    unless params.nil?
      nums = params[:num]
      self.top = Integer(params[:top])-1
      nums.each do |num|
        quotient = quotient(top, num)
        self.sum += num * arithmetic_series(quotient)
      end
      p "sum of all the numbers - #{sum}"
      check_common_multiples(nums)
      p "sum after removing common multiples - #{sum}"
    else
      p "I need something to work with !!!"
    end
  end

  private 

  def quotient(dividend, divisor)
    quotient = Integer(dividend/divisor)
  end

  # sum of all the numbers in arithmetic sequence from 1 to n
  def arithmetic_series(number)
    number*(number+1)/2
  end

  def check_common_multiples(nums)
    while nums.size > 1
      first = nums.first
      nums.shift
      nums.each do |num|
        common_multiple = first * num
        quotient = quotient(top, common_multiple)
        self.sum -= common_multiple * arithmetic_series(quotient)
      end
    end
  end
end

# Testing - will add these to a spec in future :)
# msum = MultipleSum.new
# msum.sum_multiples({num: [3,5], top: 1000})