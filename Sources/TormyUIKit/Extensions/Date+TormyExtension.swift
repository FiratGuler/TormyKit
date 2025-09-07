//
//  Date+Extensions.swift
//  Wordy
//
//  Created by Fırat Güler on 4.09.2025.
//

import Foundation

public extension Date {
    
    enum FormatType {
        /// Result  "20 Dec 2025 06:00"
        case fullDateWithTime
        
        /// Result  "20 Dec 2025"
        case onlyDate
        
        /// Result  "06:00"
        case onlyTime
        
        /// Result  "1"
        case day
        
        /// Result  "Jan"
        case month
        
        /// Result  "2025"
        case year
        
        /// Result  "Aug 10"
        case monthDay
        
        /// Result  "July 2025"
        case monthYear
        
        /// Result  "Aug 27, 09:29"
        case monthDayHourMinute
        
        var format: String {
            switch self {
            case .fullDateWithTime: return "dd MMM yyyy HH:mm"
            case .onlyDate: return "dd MMM yyyy"
            case .onlyTime: return "HH:mm"
            case .day: return "d"
            case .month: return "MMM"
            case .year: return "yyyy"
            case .monthDay: return "MMM d"
            case .monthYear: return "LLLL yyyy"
            case .monthDayHourMinute: return "MMM dd, HH:mm"
            }
        }
    }
    
    func formatted(_ formatType: FormatType = .fullDateWithTime) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formatType.format
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
    //
    //    /// "Today, Aug 27" / "Yesterday, Aug 26" / "Monday, Aug 25"
    //    func formattedDayDate() -> String {
    //        let calendar = Calendar.current
    //        let formatter = DateFormatter()
    //        formatter.locale = Locale(identifier: "en_US_POSIX")
    //        formatter.dateFormat = "MMM dd"
    //
    //        let dayPart = formatter.string(from: self)
    //#warning("Localizable")
    //        if calendar.isDateInToday(self) {
    //            return "Today, \(dayPart)"
    //        } else if calendar.isDateInYesterday(self) {
    //            return "Yesterday, \(dayPart)"
    //        } else if calendar.isDateInTomorrow(self) {
    //            return "Tomorrow, \(dayPart)"
    //        } else {
    //            formatter.dateFormat = "EEEE"
    //            let weekday = formatter.string(from: self)
    //            return "\(weekday), \(dayPart)"
    //        }
    //    }
    //
    //    /// "Today, Aug 27, 09:45"
    //    func formattedDayWithTime() -> String {
    //        let day = formattedDayDate()
    //        let time = formatted(.onlyTime)
    //        return "\(day), \(time)"
    //    }
}
