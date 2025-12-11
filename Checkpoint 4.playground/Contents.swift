// Write a function that accepts an integer frokm 1 through 10,000 and returns the integer square root of that number



enum NumberError: Error {
    case OutOfBounds
    case NoRoot
}


func acceptInteger(_ num: Int = 1, end: Int = 10_000) throws -> Int {
    
    if num < 1 || num > 10_000 {
        throw NumberError.OutOfBounds
    }
    
    for i in 1...100 {
        if i * i == num {
            return i
        }
    }
    throw NumberError.NoRoot
}

let num: Int = 100

do {
    let result = try acceptInteger(num)
    print("These numbers are intgers of the sqrt \(num) is \(result)")
} catch NumberError.OutOfBounds {
    print("Number out of Bounds")
} catch NumberError.NoRoot {
    print("No integer square root exisits for \(num)")
}
