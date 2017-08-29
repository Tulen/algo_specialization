// What's the product of the following two following 64-digit numbers? 

// 3141592653589793238462643383279502884197169399375105820974944592 
// 2718281828459045235360287471352662497757247093699959574966967627

// Karatsuba's Algorithim 
// x * y === (10^(n/2)a + b)(10^(n/2)c + d) === (10^n)ac + (10^(n/2))(ad + bc) + bd
// Base Case: 1 digit 

// STEP 1: recursively compute ac
// STEP 2: recursively compute bd
// STEP 3: recursively compute (a + b)(c + d)
// GAUSS'S TRICK = S3 - S2 - S1 => ad + bc 


// Assumes x and y have same number of digits
function karatsuba(x, y, length = (x.toString().length)) {
  
  function splitInteger(int) {
    let output = []
    let splitVal = Math.pow(10, length / 2);
    output.push((int - (int % splitVal)) / splitVal);
    output.push(int % splitVal);
   
    return output;
  }

  let firstStep = splitInteger(x)[0] * splitInteger(y)[0];
  let secondStep = splitInteger(x)[1] * splitInteger(y)[1];
  let thirdStep = (splitInteger(x)[0] + splitInteger(x)[1]) * (splitInteger(y)[0] + splitInteger(y)[1]);
  let fourthStep = thirdStep - secondStep - firstStep;
  return ((firstStep * Math.pow(10, length) + secondStep + (fourthStep * Math.pow(10, length / 2))))
};

let answer = karatsuba(3141592653589793238462643383279502884197169399375105820974944592, 2718281828459045235360287471352662497757247093699959574966967627);

