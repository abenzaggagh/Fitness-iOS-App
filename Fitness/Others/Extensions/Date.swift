//
//  Date.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 1/4/20.
//  Copyright © 2020 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation

extension Date {

  static func today() -> Date {
      return Date()
  }

  func next(_ weekday: Weekday, considerToday: Bool = false) -> Date {
    return get(.next,
               weekday,
               considerToday: considerToday)
  }

  func previous(_ weekday: Weekday, considerToday: Bool = false) -> Date {
    return get(.previous,
               weekday,
               considerToday: considerToday)
  }

    func get(_ direction: SearchDirection, _ weekDay: Weekday, considerToday consider: Bool = false) -> Date {

        let dayName = weekDay.rawValue

        let weekdaysName = getWeekDaysInEnglish().map { $0.lowercased() }

        assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")

        let searchWeekdayIndex = weekdaysName.firstIndex(of: dayName)! + 1

        let calendar = Calendar(identifier: .gregorian)

        if consider && calendar.component(.weekday, from: self) == searchWeekdayIndex {
          return self
        }

        var nextDateComponent = calendar.dateComponents([.hour, .minute, .second], from: self)
        nextDateComponent.weekday = searchWeekdayIndex

        let date = calendar.nextDate(after: self, matching: nextDateComponent, matchingPolicy: .nextTime, direction: direction.calendarSearchDirection)

        return date!
    }

}

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}


extension Date {
    
    func getWeekDaysInEnglish() -> [String] {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        return calendar.weekdaySymbols
    }

    enum Weekday: String {
        case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    }

    enum SearchDirection {
        case next
        case previous

        var calendarSearchDirection: Calendar.SearchDirection {
            switch self {
            case .next:
                return .forward
            case .previous:
                return .backward
            }
        }
    }
    
}
