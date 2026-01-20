import UIKit

func checkPrint<T, U: Equatable>(_ testedValue: T, _ response: U, expected: U) {
    let status = (response == expected) ? "✅" : "❌"
    print("Test edilen veri : \(testedValue) | Beklenen: \(expected) | Gelen: \(response) \(status)")
}

// Platform: Exercism, First 20 Algorithm Questions

// Algorithm 1: Layers of Lasagna

// Solution

print("Algorithm 1: Layers of Lasagna \n")

let expectedMinutesInOven: Int = 40
let layerValue: Int = 2

func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
    return expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(layers: Int) -> Int {
    return layers * layerValue
}

func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int {
    return elapsedMinutes + preparationTimeInMinutes(layers: layers)
}

checkPrint(30, remainingMinutesInOven(elapsedMinutes: 30), expected: 10)
checkPrint(2, preparationTimeInMinutes(layers: 2), expected: 4)
checkPrint("layer: 2, elapsedMinutes: 30", totalTimeInMinutes(layers: 2, elapsedMinutes: 30), expected: 34)

print("\n--------------------------------------------------------\n")

// Algorithm 2: Wings Quest

// Solution

print("Algorithm 2: Wings Quest \n")

func bonusPoints(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
    return powerUpActive && touchingEagle
}

func score(touchingPowerUp: Bool, touchingSeed: Bool) -> Bool {
    return touchingPowerUp || touchingSeed
}

func lose(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
    return touchingEagle && !powerUpActive
}

func win(hasPickedUpAllSeeds: Bool, powerUpActive: Bool, touchingEagle: Bool) -> Bool {
    return hasPickedUpAllSeeds && !(lose(powerUpActive: powerUpActive, touchingEagle: touchingEagle))
}

checkPrint("Bonus Point, powerUpActive: true, touchingEagle: true", bonusPoints(powerUpActive: true, touchingEagle: true), expected: true)
checkPrint("Bonus Point, powerUpActive: true, touchingEagle: false", bonusPoints(powerUpActive: true, touchingEagle: false), expected: false)

checkPrint("Score, touchingPowerUp: true, touchingSeed: true", score(touchingPowerUp: true, touchingSeed: true), expected: true)
checkPrint("Score, touchingPowerUp: true, touchingSeed: false", score(touchingPowerUp: true, touchingSeed: false), expected: true)
checkPrint("Score, touchingPowerUp: false, touchingSeed: false", score(touchingPowerUp: false, touchingSeed: false), expected: false)

checkPrint("Lose, powerUpActive: false, touchingEagle: true", lose(powerUpActive: false, touchingEagle: true), expected: true)
checkPrint("Lose, powerUpActive: true, touchingEagle: true", lose(powerUpActive: true, touchingEagle: true), expected: false)

checkPrint("Win, hasPickedUpAllSeeds: true, powerUpActive: true, touchingEagle: true", win(hasPickedUpAllSeeds: true, powerUpActive: true, touchingEagle: true), expected: true)
checkPrint("Win, hasPickedUpAllSeeds: true, powerUpActive: false, touchingEagle: true", win(hasPickedUpAllSeeds: true, powerUpActive: false, touchingEagle: true), expected: false)
checkPrint("Win, hasPickedUpAllSeeds: false, powerUpActive: true, touchingEagle: true", win(hasPickedUpAllSeeds: false, powerUpActive: true, touchingEagle: true), expected: false)
checkPrint("Win, hasPickedUpAllSeeds: false, powerUpActive: false, touchingEagle: true", win(hasPickedUpAllSeeds: false, powerUpActive: false, touchingEagle: true), expected: false)

