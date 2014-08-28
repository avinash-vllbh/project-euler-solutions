# Sum square difference
# The sum of the squares of the first ten natural numbers is, 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is, (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

class SumSquareDifference

  #Return the difference of square of sum - sum of squares
  # Time complexity - O(1)
  # Space complexity - O(1)
  def get_difference(input)
    if(Integer(input) rescue false)
      return sum_square(input)-squares_sum(input)
    else
      ArgumentError.new("Enter a valid integer number")
    end
  end

  private

  # formula for sum of 1..N integers is sum(n) = n(n+1)/2
  # Return the square of above sum
  def sum_square(input)
    sum = (input*(input+1))/2
    return sum*sum
  end

  # formula for sum of squares of 1..N integers is sum(n^2) = n(n+1)(2n+1)/6
  # We could even find the sum of cubes of 1..N integers sum(n^3) = (n(n+1)/2)^2
  def squares_sum(input)
    return (input*(input+1)*(2*input+1))/6
  end

end

diff = SumSquareDifference.new
puts "difference b/w square of sum and sum of squares is: #{diff.get_difference(100)}"

