//
//  DateFormatterHelper.swift
//  SideStore
//
//  Created by Fabian Thies on 20.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import Foundation

struct DateFormatterHelper {
    
    private static let appExpirationDateFormatter: DateComponentsFormatter = {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.zeroFormattingBehavior = [.pad]
        dateComponentsFormatter.collapsesLargestUnit = false
        return dateComponentsFormatter
    }()
    
    
    static func string(forExpirationDate date: Date) -> String {
        let startDate = Date()
        let interval = date.timeIntervalSince(startDate)
        guard interval > 0 else {
            return "EXPIRED"
        }
        
        if interval < (24 * 60 * 60) {
            self.appExpirationDateFormatter.unitsStyle = .positional
            self.appExpirationDateFormatter.allowedUnits = [.minute, .second]
        } else {
            self.appExpirationDateFormatter.unitsStyle = .full
            self.appExpirationDateFormatter.allowedUnits = [.day]
        }
            
        return self.appExpirationDateFormatter.string(from: startDate, to: date) ?? ""
        }
        
        return self.appExpirationDateFormatter.string(from: startDate, to: date) ?? ""
    }
}
