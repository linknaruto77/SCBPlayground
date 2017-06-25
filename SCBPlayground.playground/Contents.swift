
func reorder(input: [[Int]]) -> [Int] {
    var balls = [1, 2, 3, 4, 5, 6, 7, 8]
    // If input is empty or doesn't contains number of sets, return default ball order
    guard let K = input.first, K.count > 1  else { return balls }
    
    // Remove N and K from operations list
    var inputCopy = Array(input)
    inputCopy.removeFirst()
    
    // Number of sets loop
    for _ in 1...K[1] {
        // Iterate input with operations
        for operation in inputCopy {
            let index1 = operation[0] - 1
            let index2 = operation[1] - 1
            swap(&balls[index1], &balls[index2])
        }
    }
    return balls
}

func output(balls: [Int]) -> String {
    return balls.map({"\($0)"}).joined(separator: " ")
}

let input = [[4, 2], [1, 2], [2, 3], [3, 4], [4, 1]]
//let input = [[16, 1000000000], [1, 3], [5, 8], [3, 5], [2, 6], [3, 7], [3, 4], [4, 7], [2, 4], [1, 3], [2, 7], [2, 7], [2, 4], [6, 7], [1, 7], [3, 4], [1, 6]]
print(output(balls: reorder(input: input)))
