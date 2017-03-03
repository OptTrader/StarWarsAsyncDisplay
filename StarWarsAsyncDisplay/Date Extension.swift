//
//  Date Extension.swift
//  StarWarsAsyncDisplay
//
//  Created by Chris Kong on 2/24/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation

extension Date {
    
    static func date(yyyyMMdd: String?) -> Date? {
        if let string = yyyyMMdd {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.timeZone = TimeZone(abbreviation: "UTC")
            
            return formatter.date(from: string)
        }
        return nil
    }
    
}
