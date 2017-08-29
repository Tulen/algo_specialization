# What's the product of the following two following 64-digit numbers? 

# 3141592653589793238462643383279502884197169399375105820974944592 
# 2718281828459045235360287471352662497757247093699959574966967627

# Karatsuba's Algorithim 
# x * y === (10^(n/2)a + b)(10^(n/2)c + d) === (10^n)ac + (10^(n/2))(ad + bc) + bd
# Base Case: 1 digit 

# STEP 1: recursively compute ac
# STEP 2: recursively compute bd
# STEP 3: recursively compute (a + b)(c + d)
# GAUSS'S TRICK = S3 - S2 - S1 => ad + bc 


# Assumes x and y have same number of digits
# Doesn't work for 
def split_integer(int, length)
  output = []
  split_val = 10**(length / 2)
  output << ((int - (int % split_val)) / split_val)
  output << (int % split_val)

  output
end

def karatsuba(x, y, length = x.to_s.length)
  
  first_step = split_integer(x, length)[0] * split_integer(y, length)[0]
  second_step = split_integer(x, length)[1] * split_integer(y, length)[1]
  third_step = (split_integer(x, length)[0] + split_integer(x, length)[1]) * (split_integer(y, length)[0] + split_integer(y, length)[1])
  fourth_step = third_step - second_step - first_step
  return ((first_step * 10**length + second_step + (fourth_step * 10**(length / 2))))

end 

answer = karatsuba(3141592653589793238462643383279502884197169399375105820974944592, 2718281828459045235360287471352662497757247093699959574966967627)
puts answer