import Foundation

// {{## BEGIN simple ##}}
func sayHello(personName : String) -> String {
    return "Hello, \(personName)"
}
print(sayHello(personName: "Fred"))
// {{## END simple ##}}


do {
// {{## BEGIN shorthand ##}}
func rollDice(numberOfDice : UInt, times : UInt, withBonus : UInt) -> [UInt] {
    var results : [UInt] = []
    for _ in 1...times {
        var accum : UInt = 0
        for _ in 1...numberOfDice {
            let dieRoll = UInt(arc4random_uniform(6) + 1)
            accum += dieRoll
        }
        results.append (accum + withBonus)
    }
    
    return results
}
let dieRolls = rollDice(numberOfDice: 3, times: 6, withBonus: 0)
print(dieRolls)
// {{## END shorthand ##}}
}

do {
// {{## BEGIN extern-names ##}}
func rollDice(numberOfDice num : UInt, times t : UInt, withBonus bonus : UInt) -> [UInt] {
    var results : [UInt] = []
    for _ in 1...t {
        var accum : UInt = 0
        for _ in 1...num {
            let dieRoll = UInt(arc4random_uniform(6) + 1)
            accum += dieRoll
        }
        results.append (accum + bonus)
    }
  
    return results
}
let dieRolls = rollDice(numberOfDice: 3, times: 6, withBonus: 0)
print(dieRolls)
// {{## END extern-names ##}}
}

do {
// {{## BEGIN default-names ##}}
func rollDice(_ num : UInt, times t : UInt, withBonus bonus : UInt) -> [UInt] {
    var results : [UInt] = []
    for _ in 1...t {
        var accum : UInt = 0
        for _ in 1...num {
            let dieRoll = UInt(arc4random_uniform(6) + 1)
            accum += dieRoll
        }
        results.append (accum + bonus)
    }
  
    return results
}
let dieRolls = rollDice(3, times: 6, withBonus: 0)
print(dieRolls)
// {{## END default-names ##}}
}

do {
// {{## BEGIN default-params ##}}
func rollDice(numberOfDice : UInt, times : UInt, withBonus : UInt = 0) -> [UInt] {
    var results : [UInt] = []
    for _ in 1...times {
        var accum : UInt = 0
        for _ in 1...numberOfDice {
            let dieRoll = UInt(arc4random_uniform(6) + 1)
            accum += dieRoll
        }
        results.append (accum + withBonus)
    }
  
    return results
}
let dieRolls = rollDice(numberOfDice: 3, times: 6)
print(dieRolls)
// {{## END default-params ##}}
}

do {
// {{## BEGIN variadic ##}}
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))
// {{## END variadic ##}}  
}

do {
// {{## BEGIN anonymous ##}}
let addFunc = { (left : Int, right : Int) -> Int in return left + right }
print("1 + 2 = \(addFunc(1,2))")
// {{## END anonymous ##}}
}

do {
// {{## BEGIN inferred ##}}
let addFunc : (Int, Int) -> Int = { (left, right) in return left + right }
print("1 + 2 = \(addFunc(1,2))")
// {{## END inferred ##}}
}

do {
// {{## BEGIN inferred-return ##}}
let addFunc : (Int, Int) -> Int = { (left, right) in left + right }
print("1 + 2 = \(addFunc(1,2))")
// {{## END inferred-return ##}}
}

do {
// {{## BEGIN inferred-params ##}}
let addFunc : (Int, Int) -> Int = { $0 + $1 }
print("1 + 2 = \(addFunc(1,2))")
// {{## END inferred-params ##}}
}

do {
// {{## BEGIN func-values ##}}
func mathOp(left : Int, right : Int, op : (Int, Int) -> Int) -> Int {
    return op(left, right)
}
// {{## END func-values ##}}
}

do {
// {{## BEGIN nested ##}}
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue = -2
let moveNearerToZero = chooseStepFunction(backwards: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -2...
// -1...
// zero!
// {{## END nested ##}}
}

do {
// {{## BEGIN trailing ##}}
func mathOp(left : Int, right : Int, op : (Int, Int) -> Int) -> Int {
    return op(left, right)
}
let result = mathOp(left: 1, right: 2) { $0 + $1 }
print("Result = \(result)")
// {{## END trailing ##}}
}

