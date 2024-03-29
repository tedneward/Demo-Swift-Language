print("Hello world!")

// {{## BEGIN locals ##}}
let money = 42000
// let moneyD : Double = money // Illegal
let moneyD2 : Double = Double(money)

var moneyD = 42000
moneyD = 50000
// {{## END locals ##}}

// {{## BEGIN string-initialization ##}}
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
// {{## END string-initialization ##}}

// {{## BEGIN string-interpolation ##}}
let age = 42
let message = "He is \(age) years old"
// {{## END string-interpolation ##}}
