import UIKit

func checkPrint<T, U: Equatable>(_ testedValue: T, _ response: U, expected: U) {
    let status = (response == expected) ? "✅" : "❌"
    print("Test edilen veri : \(testedValue) | Beklenen: \(expected) | Gelen: \(response) \(status)")
}

// Platform: Exercism, First 20 Algorithm Questions

// First Algorithm: Layers of Lasagna

// Solution

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

