//
//  Station.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/12/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

@objcMembers
class Station: NSObject {
    
    var stationName: String?
    var address: String?
    var ocuppiedSpots, emptySpots, maximumNumberOfBikes: Int?
    var lastSyncDate: String?
    var idStatus: Int?
    var status, statusType: String?
    var latitude, longitude: Double?
    var isValid, customIsValid: Bool?
    var notifies: [Any?]?
    var id: Int?
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        
    }
}
