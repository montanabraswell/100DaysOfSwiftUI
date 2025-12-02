import Cocoa

// looping between 1 through 100
for num in 1...100 {
    // Checking to see if multiple of 3, if so print Fizz
    if num.isMultiple(of: 3) {
        print("Fizz")
        // Checking to see if multiple of 5, if so print Buzz
        if num.isMultiple(of: 5) {
            print("Buzz")
            // Checking to see if multiple of 3 and 5, if so print FizzBuzz
            if num % 3 == 0 && num % 5 == 0 {
                print("FizzBuzz")
            }
        }
        // Print out the rest of the numbers that aren't apart of the check above
    } else {
        print(num)
    }
}
