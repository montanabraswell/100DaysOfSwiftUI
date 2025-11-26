// Checkpoint 2
// Montana Braswell


import Cocoa

let jojoCharacters = ["Jonathan", "Joseph", "Jotaro", "Josuke", "Giorno"]

// Making a set of array removes duplicates due to Sets cant have duplicates
let uniqueJC = Set(jojoCharacters)

// Printing the number of elements in the array jojoCharacters
print(jojoCharacters.count)

// Printing the number of elements in uniqueJC
print(uniqueJC.count)

// Making a set of the array removing duplicates
let uniqueJCArray = Array(uniqueJC)

// Printing the numbers of the elements in the array
print(uniqueJCArray)
