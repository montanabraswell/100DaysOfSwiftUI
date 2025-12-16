// Montana
// Checkpoint 5

// With the input provided
// Fill out any numbers that are even
// Sort teh array in ascending order
// Map them to strings in the format "7 is a lucky mimber"
// Print the resulting array, one item per line


let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let sortedLuckyNumbers = luckyNumbers.sorted()

let oddLuckyNumbers = sortedLuckyNumbers.filter { number in
    if number % 2 != 0 {
        return true
    } else {
        return false
    }
}

let luckyStrings = oddLuckyNumbers.map { number in
    return "\(number) is a lucky number"
}

for item in luckyStrings {
    print(item)
}
