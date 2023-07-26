//
//  FuntionManager.swift
//  University Wizard 2
//
//  Created by Henry Krieger on 28.06.23.
//

import Foundation

/// The function generates a title for the home view depending on the time of the day.
/// - Returns: title: String
func getGreeting() -> String {
    let now = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: now)
    
    if hour >= 6 && hour < 12 {
        return "Good Morning"
    } else if hour >= 12 && hour < 18 {
        return "Good Afternoon"
    } else if hour >= 18 && hour < 22 {
        return "Good Evening"
    } else if hour >= 22 || hour < 6 {
        return "Good Night"
    }
    return "Home"
}

/// Creates a date formatted the following: Weekday, Month Day, Year
/// - Returns: the generated date: String
func getDate() -> String {
    let now = Date()
    let calendar = Calendar.current
    let weekday = calendar.component(.weekday, from: now)
    let day = calendar.component(.day, from: now)
    let month = calendar.component(.month, from: now)
    let year = calendar.component(.year, from: now)
    
    return "\(getWeekday(input: weekday)), \(getMonth(input: month)) \(day), \(year)"
}

/// Maps a given month from a calendar component to the corresponding month
/// - Parameter input: Int in range 1...12
/// - Returns: month: String
func getMonth(input: Int) -> String {
    if input == 1 {
        return "January"
    } else if input == 2 {
        return "February"
    } else if input == 3 {
        return "March"
    } else if input == 4 {
        return "April"
    } else if input == 5 {
        return "May"
    } else if input == 6 {
        return "June"
    } else if input == 7 {
        return "July"
    } else if input == 8 {
        return "August"
    } else if input == 9 {
        return "September"
    } else if input == 10 {
        return "October"
    } else if input == 11 {
        return "November"
    } else if input == 12 {
        return "December"
    }
    return ""
}

/// Maps a given weekday from a calendar component to the corresponding weekday
/// - Parameter input: Int in range 1...7
/// - Returns: weekday: String
func getWeekday(input: Int) -> String {
    if input == 1 {
        return "Monday"
    } else if input == 2 {
        return "Tuesday"
    } else if input == 3 {
        return "Wednesday"
    } else if input == 4 {
        return "Thursday"
    } else if input == 5 {
        return "Friday"
    } else if input == 6 {
        return "Saturday"
    } else if input == 7 {
        return "Sunday"
    }
    return ""
}
