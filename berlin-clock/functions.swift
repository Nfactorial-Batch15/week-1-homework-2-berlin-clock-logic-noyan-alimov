//
//  functions.swift
//  berlin-clock
//
//  Created by Noyan Alimov on 02/12/2021.
//

import Foundation

func unwrap<T>(value: T?) throws -> T {
    guard let value = value else { throw AppError.optionalUnwrapError }
    return value
}

func unwrapAndCastToInt(value: String?) throws -> Int {
    do {
        let value = try unwrap(value: value)
        let valueIntOptional = Int(value)
        guard let valueInt = valueIntOptional else { throw AppError.invalidInputError }
        return valueInt
    } catch {
        throw error
    }
}

func getUserInput() throws -> [String: Int] {
    print("Please enter hours: ")
    let hoursOptional = readLine()
    
    print("Please enter minutes: ")
    let minutesOptional = readLine()
    
    print("Please enter seconds: ")
    let secondsOptional = readLine()
    
    do {
        return [
            "hours": try unwrapAndCastToInt(value: hoursOptional),
            "minutes": try unwrapAndCastToInt(value: minutesOptional),
            "seconds": try unwrapAndCastToInt(value: secondsOptional)
        ]
    } catch {
        throw error
    }
}

func generate(symbol: String, count: Int) -> String {
    if count == 0 {
        return ""
    } else if count == 1 {
        return symbol
    }
    
    var output = ""
    for _ in 1...count {
        output += symbol
    }
    return output
}

func getMinutesRows(minutes: Int) -> [String: String] {
    let notRemainder = minutes / 5
    let remainder = minutes % 5
    
    let notRemainderYs = generate(symbol: "Y", count: notRemainder)
    let remainderYs = generate(symbol: "Y", count: remainder)
    
    let notRemainderNs = generate(symbol: "N", count: 11 - notRemainder)
    let remainderNs = generate(symbol: "N", count: 4 - remainder)
    
    return [
        "fiveMinuteRow": notRemainderYs + notRemainderNs,
        "singleMinuteRow": remainderYs + remainderNs
    ]
}

func getHoursRows(hour: Int) -> [String: String] {
    let notRemainder = hour / 5
    let remainder = hour % 5
    
    let notRemainderYs = generate(symbol: "Y", count: notRemainder)
    let remainderYs = generate(symbol: "Y", count: remainder)
    
    let notRemainderNs = generate(symbol: "N", count: 4 - notRemainder)
    let remainderNs = generate(symbol: "N", count: 4 - remainder)
    
    return [
        "fiveHourRow": notRemainderYs + notRemainderNs,
        "singleHourRow": remainderYs + remainderNs
    ]
}

func getSecondsLamp(seconds: Int) -> String {
    let isEven = seconds % 2 == 0
    return isEven ? "Y" : "N"
}
