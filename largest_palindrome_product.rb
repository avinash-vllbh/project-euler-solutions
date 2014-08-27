# Largest palindrome product
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.
require 'pry'
class InvalidArgument < StandardError; end
class LargestPalindromeProduct
  
  def palindrome_number(input)
    if(Integer(input) rescue false)
      # Initiate all three numbers varaibles to 0
      large_palindrome, factor1, factor2 = 0, 0, 0
      max_factor = max_factor_number(input)
      min_factor = min_factor_number(input)
      a = max_factor
      while a >= min_factor
        b = max_factor
        while b >= a
          product = a*b
          if product <= large_palindrome 
            break # Break since all the other products in this loop will be less than the  value in large_palindrome
          end
          if is_palindrome(product)
            large_palindrome = product
            factor1 = b
            factor2 = a
          end
          b = b-1
        end
        a = a-1
      end
      puts large_palindrome, factor1, factor2
    else
      puts ArgumentError.new("Need a valid integer as input")
    end
  end

  private
  ##
  # gives the maximum number to start with 
  # Eg. if 3, then we need 999
  ##
  def max_factor_number(input)
    number = "9"*input
    return number.to_i
  end

  ##
  # gives the minimum number to start with 
  # Eg. if 3, then we need 100
  ##
  def min_factor_number(input)
    number = "1"
    zeros = "0"*(input-1)
    number = number + zeros
    return number.to_i
  end

  # Checks if a number is palindrome or not using string reversal
  def is_palindrome(number)
    number = number.to_s
    if number == number.reverse
      return true
    else
      return false
    end
  end
end

# palindrome = LargestPalindromeProduct.new
# palindrome.palindrome_number(3)