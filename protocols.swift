// {{## BEGIN protocol ##}}
protocol FullyNamed {
    var fullName : String { get }
}

protocol RandomNumberGenerator {
    func random() -> Double
}
// {{## END protocol ##}}


// {{## BEGIN implementing ##}}
struct Person : FullyNamed {
    var fullName : String
}

class LinearCongruentialGenerator: 
    RandomNumberGenerator {

    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
      lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
      return lastRandom / m
    }
}
// {{## END implementing ##}}

// {{## BEGIN delegates ##}}
class Dice {
    let sides : Int
    let generator : RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
      self.sides = sides
      self.generator = generator
    }
    func roll() -> Int {
      return Int(generator.random() * Double(sides)) + 1
    }
}
protocol DiceGame {
    var dice : Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}
// {{## END delegates ##}}

