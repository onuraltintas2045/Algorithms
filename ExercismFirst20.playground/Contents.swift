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

func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
    return { inputPass in
        if inputPass == password {
            return secret
        } else {
            return "Sorry. No hidden secrets here."
        }
    }
}

func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
    let x = f(room)
    let y = f(x)
    let z = f(y)
    
    return (x, y, z)
}

let secretKey = protectSecret("Kilit açıldı.", withPassword: "Onur")
checkPrint("Yanlış şifre.", secretKey("yanlisSifre"), expected: "Sorry. No hidden secrets here.")
checkPrint("Doğru şifre", secretKey("Onur"), expected: "Kilit açıldı.")

// Some Closure Examp

func makeAdder(_ a: Int) -> (Int) -> Int {
    return { b in
        return a + b
    }
}

let addFive = makeAdder(5)
addFive(3) // 8

func makeThresholdChecker(_ limit: Int) -> (Int) -> Bool {
    return { value in
        return value >= limit
    }
}

let isEnough = makeThresholdChecker(10)
isEnough(8)   // false
isEnough(12)  // true

print("\n--------------------------------------------------------\n")

// Algorithm 6: Vexing Vehicle Purchase

// Solution

print("Algorithm 6: Vexing Vehicle Purchase \n")

func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    let fiveYearBudget = monthlyBudget * 60
    
    if price <= fiveYearBudget {
        return "Yes! I'm getting a \(vehicle)"
    } else if (price - fiveYearBudget) <= (fiveYearBudget * 0.1) {
        return "I'll have to be frugal if I want a \(vehicle)"
    } else {
        return "Darn! No \(vehicle) for me"
    }
}

func licenseType(numberOfWheels wheels: Int) -> String {
    switch wheels{
        case 2,3:
            return "You will need a motorcycle license for your vehicle"
        case 4,6:
            return "You will need an automobile license for your vehicle"
        case 18:
            return "You will need a commercial trucking license for your vehicle"
        default:
            return "We do not issue licenses for those types of vehicles"
    }
}

func calculateResellPrice(originalPrice: Int, yearsOld: Int) -> Int {
    if yearsOld < 3 {
        return (originalPrice * 80) / 100
    } else if yearsOld >= 10 {
        return (originalPrice * 50) / 100
    } else {
        return (originalPrice * 70) / 100
    }
}

checkPrint("Can buy", canIBuy(vehicle: "2025 Tesla Model S", price: 516.32, monthlyBudget: 100.00), expected: "Yes! I'm getting a 2025 Tesla Model S")
checkPrint("Can't buy < %10 ", canIBuy(vehicle: "2025 Tesla Model X", price: 12500, monthlyBudget: 200.00), expected: "I'll have to be frugal if I want a 2025 Tesla Model X")
checkPrint("Can't buy > %10", canIBuy(vehicle: "Mercedes AMG GT 63S", price: 2_250_880.00, monthlyBudget: 10000.00), expected: "Darn! No Mercedes AMG GT 63S for me")

print("\n")

checkPrint("License Type 2,3", licenseType(numberOfWheels: 2), expected: "You will need a motorcycle license for your vehicle")
checkPrint("License Type 4,6", licenseType(numberOfWheels: 6), expected: "You will need an automobile license for your vehicle")
checkPrint("License Type 18", licenseType(numberOfWheels: 18), expected: "You will need a commercial trucking license for your vehicle")
checkPrint("License Type any number", licenseType(numberOfWheels: -21), expected: "We do not issue licenses for those types of vehicles")

print("\n")

checkPrint("ResellPrice < 3 years old", calculateResellPrice(originalPrice: 1000, yearsOld: 2), expected: 800)
checkPrint("ResellPrice >= 10 years old", calculateResellPrice(originalPrice: 1000, yearsOld: 11), expected: 500)
checkPrint("ResellPrice 2 < x < 10 years old", calculateResellPrice(originalPrice: 1000, yearsOld: 5), expected: 700)

print("\n--------------------------------------------------------\n")

// Algorithm 7: Magician-in-Training

// Solution

print("Algorithm 7: Magician-in-Training \n")

func getCard(at index: Int, from stack: [Int]) -> Int {
    return stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
    guard index < stack.count && index >= 0 else { return stack }
    
    var newStack = stack
    newStack[index] = newCard
    return newStack
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
    var newStack = stack
    newStack.append(newCard)
    return newStack
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
    guard index < stack.count && index >= 0 else { return stack }
    var newStack = stack
    newStack.remove(at: index)
    return newStack
}

func insert(_ newCard: Int, at index: Int, from stack: [Int]) -> [Int] {
    guard index <= stack.count && index >= 0 else { return stack }
    var newStack = stack
    newStack.insert(newCard, at: index)
    return newStack
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
    stack.count == size
}

checkPrint("Get Card [1,2,3,4], index: 2", getCard(at: 2, from: [1,2,3,4]), expected: 3)
checkPrint("SetCard at 0, [1,2,3,4], newCard: 5", setCard(at: 0, in: [1,2,3,4], to: 5), expected: [5,2,3,4])
checkPrint("Insert at top 5, [1,2,3,4]", insert(5, atTopOf: [1,2,3,4]), expected: [1,2,3,4,5])
checkPrint("removeCard at 1, [1,0,2,3,4]", removeCard(at: 1, from: [1,0,2,3,4]), expected: [1,2,3,4])
checkPrint("Insert at 1, [1,3,4,5], number: 2", insert(2, at: 1, from: [1,3,4,5]), expected: [1,2,3,4,5])
checkPrint("check size of Stack [1,2,3,4]", checkSizeOfStack([1,2,3,4], 4), expected: true)
checkPrint("check size of Stack [1,2,3,4]", checkSizeOfStack([1,2,3,4], 1), expected: false)

print("\n--------------------------------------------------------\n")

// Algorithm 8: ChessBoard

// Solution

print("Algorithm 8: ChessBoard \n")
