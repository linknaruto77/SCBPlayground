
func reorder(input: [[Int]]) -> [Int] {
    var balls = [1, 2, 3, 4, 5, 6, 7, 8]
    // If input is empty or doesn't contains number of sets, return default ball order
    guard let K = input.first, K.count > 1  else { return balls }
    let nbOfOperations = K[0]
    print("NB OF OPERATIONS : \(nbOfOperations)")
    let nbOfSets = K[1]
    print("NB OF SETS : \(nbOfSets)")
    
    // Remove N and K from operations list
    var inputCopy = Array(input)
    inputCopy.removeFirst()
    
    // If nb of operations doesn't match, returns
    if nbOfOperations != inputCopy.count {
        return balls
    }
    
    // Iterate 'input' with operations for the first set
    var order = balls
    for operation in inputCopy {
        let index1 = operation[0] - 1
        let index2 = operation[1] - 1
        swap(&order[index1], &order[index2])
    }
    print("FIRST SET ORDER : \(order)")
    
    // Get the number of iterations before the order goes back to its original position
    var nbOfIteration = 0
    var tmpOrder = balls
    for index in 1...nbOfSets {
        // Replace the order from first set at beginning and end
        var newOrder = [Int]()
        for (_, value) in order.enumerated() {
            newOrder.append(tmpOrder[value - 1])
        }
        if balls == newOrder {
            nbOfIteration = index
            break
        }
        tmpOrder = newOrder
    }
    print("NB OF ITERATIONS TO ORIGINAL ORDER : \(nbOfIteration)")
    
    // If setsLeft == 0, then the balls are in order
    let setsLeft = nbOfIteration == 0 ? (nbOfSets - 1) : ((nbOfSets % nbOfIteration) - 1)
    print("SETS LEFT : \(setsLeft)")
    if setsLeft == 0 {
        return balls
    }
    
    // Iterate in the number of sets left
    for _ in 0...setsLeft {
        // Replace the order from first set at beginning and end
        var newOrder = [Int]()
        for (_, value) in order.enumerated() {
            newOrder.append(balls[value - 1])
        }
        balls = newOrder
    }
    return balls
}

func output(balls: [Int]) -> String {
    return balls.map({"\($0)"}).joined(separator: " ")
}

//let input = [[4, 2], [1, 2], [2, 3], [3, 4], [4, 1]]
let input = [[16, 1000000000], [1, 3], [6, 8], [3, 5], [2, 6], [3, 7], [3, 4], [4, 7], [2, 4], [1, 3], [2, 7], [2, 7], [2, 4], [6, 7], [1, 7], [3, 4], [1, 6]]
print(output(balls: reorder(input: input)))
