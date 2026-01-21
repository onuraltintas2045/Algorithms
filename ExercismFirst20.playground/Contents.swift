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

print("\n--------------------------------------------------------\n")

// Algorithm 3: Freelancer Rates

// Solution

print("Algorithm 3: Freelancer Rates \n")


func dailyRateFrom(hourlyRate: Int) -> Double {
    return 8.0 * Double(hourlyRate)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
    let monthlyRate = 22.0 * (8.0 * Double(hourlyRate))
    return (monthlyRate - ((monthlyRate * discount)/100)).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
    let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
    let dailyRateWithDiscount = dailyRate - (dailyRate * discount)/100
    return (budget / dailyRateWithDiscount).rounded(.down)
}

checkPrint("DailyRate for hourlyRate: 80", dailyRateFrom(hourlyRate: 80), expected: 640.0)
checkPrint("MonthlyRate for hourlyRate: 77, discount: 10.5", monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5), expected: 12129)
checkPrint("WorkDaysIn for budget: 20000, hourlyRate: 80, discount: 11", workdaysIn(budget: 20000, hourlyRate: 80, withDiscount: 11), expected: 35)

print("\n--------------------------------------------------------\n")

// Algorithm 4: Cal's Custom Sign Shop

// Solution

print("Algorithm 4: Cal's Custom Sign Shop \n")

let birthday: String = "Birthday"
let valentine: String = "Valentine's Day"
let anniversary: String = "Anniversary"

let space: Character = " "
let exclamation: Character = "!"

func buildSign(for occasion: String, name: String) -> String {
    return "Happy \(occasion) \(name)\(exclamation)"
}

func graduationFor(name: String, year: Int) -> String {
    return "Congratulations \(name)\(exclamation)\nClass of \(year)"
}

func costOf(sign: String) -> Int {
    return 20 + (sign.count * 2)
}

checkPrint("Birthday, Onur", buildSign(for: "Birthday", name: "Onur"), expected: "Happy Birthday Onur!")
checkPrint("Graduation for name: Onur, year: 2023", graduationFor(name: "Onur", year: 2023), expected: "Congratulations Onur!\nClass of 2023")
checkPrint("costOf, Happy Birthday Onur!", costOf(sign: "Happy Birthday Onur!"), expected: 60)

print("\n--------------------------------------------------------\n")

// Algorithm 5: Secret Agent Double-Null0111

// Solution

print("Algorithm 5: Secret Agent Double-Null0111 \n")
