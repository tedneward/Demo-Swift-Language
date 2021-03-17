print("Hello world!")

// {{## BEGIN locals ##}}
let money = 42000
// let moneyD : Double = money // Illegal
let moneyD2 : Double = Double(money)

var moneyD = 42000
moneyD = 50000
// {{## END locals ##}}

// {{## BEGIN string-interpolation ##}}
let age = 42
let message = "He is \(age) years old"
print(message)
// {{## END string-interpolation ##}}
