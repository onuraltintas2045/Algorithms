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

let ranks = 1...8
let files = "A"..."H"

func isValidSquare(rank: Int, file: String) -> Bool {
    ranks.contains(rank) && files.contains(file)
}

func getRow(_ board : [String], rank: Int) -> [String] {
    let rowStartPosition = (rank - 1) * 8
    let rowEndPosition = rowStartPosition + 7
    
    return Array(board[rowStartPosition...rowEndPosition])
}

checkPrint("isValidSquare", isValidSquare(rank: 1, file: "A"), expected: true)
checkPrint("isValidSquare", isValidSquare(rank: 9, file: "A"), expected: false)
checkPrint("isValidSquare", isValidSquare(rank: 1, file: "Z"), expected: false)

let board = [
  "1A", "1B", "1C", "1D", "1E", "1F", "1G", "1H",
  "2A", "2B", "2C", "2D", "2E", "2F", "2G", "2H",
  "3A", "3B", "3C", "3D", "3E", "3F", "3G", "3H",
  "4A", "4B", "4C", "4D", "4E", "4F", "4G", "4H",
  "5A", "5B", "5C", "5D", "5E", "5F", "5G", "5H",
  "6A", "6B", "6C", "6D", "6E", "6F", "6G", "6H",
  "7A", "7B", "7C", "7D", "7E", "7F", "7G", "7H",
  "8A", "8B", "8C", "8D", "8E", "8F", "8G", "8H"
]

checkPrint("GetRow: 1", getRow(board, rank: 1), expected: ["1A", "1B", "1C", "1D", "1E", "1F", "1G", "1H"])
checkPrint("GetRow: 3", getRow(board, rank: 3), expected: ["3A", "3B", "3C", "3D", "3E", "3F", "3G", "3H"])

print("\n--------------------------------------------------------\n")

// Algorithm 9: Bird Watcher

// Solution

print("Algorithm 9: Bird Watcher \n")

func totalBirdCount(_ birdsPerDay: [Int]) -> Int {
    var total = 0
    for i in 0..<birdsPerDay.count {
        total += birdsPerDay[i]
    }
    return total
}

func birdsInWeek(_ birdsPerDay: [Int], weekNumber: Int) -> Int {
    var totalInWeek = 0
    let startDayOfWeek = (weekNumber - 1) * 7
    let endDayOfWeek = startDayOfWeek + 7
    
    for i in startDayOfWeek..<endDayOfWeek {
        totalInWeek += birdsPerDay[i]
    }
    
    return totalInWeek
}

func fixBirdCountLog(_ birdsPerDay: [Int]) -> [Int] {
    var fixedBirdsCount = birdsPerDay
    
    for i in stride(from: 0, to: birdsPerDay.count, by: 2) {
        fixedBirdsCount[i] = fixedBirdsCount[i] + 1
    }
    
    return fixedBirdsCount
}

let birdsPerDay = [2, 5, 0, 7, 4, 1, 3, 0, 2, 5, 0, 1, 3, 1]
let fixBirdCount = [2, 5, 0, 7, 4, 1]

checkPrint("birdsPerDay = [2, 5, 0, 7, 4, 1, 3, 0, 2, 5, 0, 1, 3, 1]", totalBirdCount(birdsPerDay), expected: 34)
checkPrint("birdsInWeek, birdsPerDay, week: 2", birdsInWeek(birdsPerDay, weekNumber: 2), expected: 12)
checkPrint("fixBirds: [2, 5, 0, 7, 4, 1] ", fixBirdCountLog(fixBirdCount), expected: [3, 5, 1, 7, 5, 1])

print("\n--------------------------------------------------------\n")

// Algorithm 10: Santa's Swifty Helper

// Solution

print("Algorithm 10: Santa's Swifty Helper \n")


func getName(_ item: (name: String, amount: Int)) -> String {
    item.name
}

func createToy(name: String, amount: Int) -> (name: String, amount: Int) {
    (name: name, amount: amount)
}

func updateQuantity(_ items: [(name: String, amount: Int)], toy: String, amount: Int) ->  [(name: String, amount: Int)] {
    var newItems = items
    for i in 0..<newItems.count {
        if newItems[i].name == toy {
            newItems[i].amount = amount
        }
    }
    
    return newItems
}

func addCategory(_ items: [(name: String, amount: Int)], category: String) -> [(name: String, amount: Int, category: String)] {
    var result: [(name: String, amount: Int, category: String)] = []
    
    for item in items {
        result.append((name: item.name, amount: item.amount, category: category))
    }
    
    return result
}

let toy = (name: "Doll", amount: 10)
checkPrint("GetName: Doll", getName(toy), expected: "Doll")

print(createToy(name: "Doll", amount: 20))

let toys = [(name: "Doll", amount: 10), (name: "Car", amount: 5), (name: "Train", amount: 3)]
print(updateQuantity(toys, toy: "Doll", amount: 20))

let categoryToys = [(name: "Car", amount: 5), (name: "Train", amount: 3)]
print(addCategory(categoryToys, category: "Vehicle"))


print("\n--------------------------------------------------------\n")

// Algorithm 11: Slice Sizing

// Solution

print("Algorithm 11: Slice Sizing \n")


func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    guard let diameter = diameter,
          let slices = slices,
          diameter >= 0,
          slices >= 1 else { return nil}
    
    let radius = diameter/2
    let area = Double.pi * radius * radius
    
    let sliceSize = area/Double(slices)
    return sliceSize.rounded()
}

func biggestSlice(
    diameterA: String, slicesA: String,
    diameterB: String, slicesB: String
) -> String {
    let diameterADouble = Double(diameterA)
    let sliceADouble = Int(slicesA)
    let diameterBDouble = Double(diameterB)
    let sliceBDouble = Int(slicesB)
    
    let sliceSizeA = sliceSize(diameter: diameterADouble, slices: sliceADouble)
    let sliceSizeB = sliceSize(diameter: diameterBDouble, slices: sliceBDouble)
    
    if sliceSizeA == nil && sliceSizeB != nil {
        return "Slice B is bigger"
    }
    
    if sliceSizeA != nil && sliceSizeB == nil {
        return "Slice A is bigger"
    }
    
    if let a = sliceSizeA, let b = sliceSizeB {
        if a > b {
            return "Slice A is bigger"
        } else if b > a {
            return "Slice B is bigger"
        }
    }
    
    return "Neither slice is bigger"
}

checkPrint("SliceSize diameter: 16, slices: 12", sliceSize(diameter: 16, slices: 12), expected: 16.75516081914556.rounded())
checkPrint("SliceSize diameter: nil, slices: 12", sliceSize(diameter: nil, slices: 12), expected: nil)

checkPrint("BiggestSlice dA: 10, sA: 6, dB: 14, sB: 16", biggestSlice(diameterA: "10", slicesA: "6", diameterB: "14", slicesB: "16"), expected: "Slice A is bigger")
checkPrint("BiggestSlice dA: 10, sA: 6, dB: 12, sB: 8", biggestSlice(diameterA: "10", slicesA: "6", diameterB: "12", slicesB: "8"), expected: "Slice B is bigger")
checkPrint("BiggestSlice dA: Pepperoni, sA: 6, dB: Sausage, sB: 8", biggestSlice(diameterA: "Pepperoni", slicesA: "6", diameterB: "Sausage", slicesB: "8"), expected: "Neither slice is bigger")



print("\n--------------------------------------------------------\n")

// Algorithm 12: Expert Mixologist

// Solution

print("Algorithm 12: Expert Mixologist \n")

func timeToPrepare(drinks: [String]) -> Double {
    var totalTime: Double = 0
    for drink in drinks {
        switch drink {
            case "beer", "soda", "water":
                totalTime += 0.5
            case "shot":
                totalTime += 1.0
            case "mixed drink":
                totalTime += 1.5
            case "fancy drink":
                totalTime += 2.5
            case "frozen drink":
                totalTime += 3.0
            default:
                totalTime += 0.0
        }
    }
    return totalTime
}

func makeWedges(needed: Int, limes: [String]) -> Int {
    var wedgesCut = 0
    var limesUsed = 0
    
    while wedgesCut < needed && limesUsed < limes.count {
        let currentLime = limes[limesUsed]
        
        switch currentLime {
            case "small":
                wedgesCut += 6
            case "medium":
                wedgesCut += 8
            case "large":
                wedgesCut += 10
            default:
                break
        }
        
        limesUsed += 1
    }
    
    return limesUsed
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
    var time = Double(minutesLeft)
    var orders = remainingOrders
    
    while time > 0 && !orders.isEmpty {
        let firstOrder = orders[0]
        let preparationTime = timeToPrepare(drinks: firstOrder)
        
        time -= preparationTime
        orders.removeFirst()
    }
    
    return orders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
    beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
    var beerOrders: [String] = []
    var sodaOrders: [String] = []
    
    for order in orders {
        if order.drink == "beer" {
            beerOrders.append(order.time)
        } else if order.drink == "soda" {
            sodaOrders.append(order.time)
        }
    }
    
    let beerResult = beerOrders.isEmpty ? nil : (first: beerOrders.first!, last: beerOrders.last!, total: beerOrders.count)
    let sodaResult = sodaOrders.isEmpty ? nil : (first: sodaOrders.first!, last: sodaOrders.last!, total: sodaOrders.count)
    
    return (beer: beerResult, soda: sodaResult)
}

checkPrint("beer, frozen drink, shot", timeToPrepare(drinks: ["beer", "frozen drink", "shot"]), expected: 4.5)
checkPrint("makeWedges = needed: 25, limes: small, small, large, medium, small)", makeWedges(needed: 25, limes: ["small", "small", "large", "medium", "small"]), expected: 4)

let remainingOrders = [["beer", "frozen drink", "shot"], ["fancy drink", "soda"], ["beer", "beer", "water"], ["mixed drink", "frozen drink"]]
checkPrint("remainingorder = minutesLeft: 5, orders: remainingOrders", finishShift(minutesLeft: 5, remainingOrders: remainingOrders), expected: [["beer", "beer", "water"], ["mixed drink", "frozen drink"]])

let orders = [
    (drink: "beer", time: "10:01"), (drink: "frozen drink", time: "10:02"),
    (drink: "shot", time: "10:05"), (drink: "fancy drink", time: "10:06"),
    (drink: "soda", time: "10:09"), (drink: "beer", time: "10:15"), (drink: "beer", time: "10:22"),
    (drink: "water", time: "10:26"), (drink: "mixed drink", time: "10:28"),
    (drink: "frozen drink", time: "10:33"),
]

print(orderTracker(orders: orders))
