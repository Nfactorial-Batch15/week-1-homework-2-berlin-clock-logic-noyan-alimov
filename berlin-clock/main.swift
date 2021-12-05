//
//  main.swift
//  berlin-clock
//
//  Created by Noyan Alimov on 02/12/2021.
//

import Foundation

func main() {
    do {
        let userInput: [String: Int] = try getUserInput()
        let minutes = try unwrap(value: userInput["minutes"])
        let hours = try unwrap(value: userInput["hours"])
        let seconds = try unwrap(value: userInput["seconds"])
        
        let minutesRows = getMinutesRows(minutes: minutes)
        let hoursRows = getHoursRows(hour: hours)
        
        let result = Result(
            singleMinuteRow: try unwrap(value: minutesRows["singleMinuteRow"]),
            fiveMinuteRow: try unwrap(value: minutesRows["fiveMinuteRow"]),
            singleHourRow: try unwrap(value: hoursRows["singleHourRow"]),
            fiveHourRow: try unwrap(value: hoursRows["fiveHourRow"]),
            secondsLamp: getSecondsLamp(seconds: seconds)
        )
        
        print(result)
    } catch {
        print(error)
    }
}

print(main())
