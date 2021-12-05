//
//  models.swift
//  berlin-clock
//
//  Created by Noyan Alimov on 02/12/2021.
//

import Foundation

enum AppError : Error {
    case optionalUnwrapError
    case invalidInputError
}

struct Result {
    let singleMinuteRow: String
    let fiveMinuteRow: String
    let singleHourRow: String
    let fiveHourRow: String
    let secondsLamp: String
}
