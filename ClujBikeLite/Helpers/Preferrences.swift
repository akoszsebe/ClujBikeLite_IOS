//
//  Preferrences.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/14/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

class Preferences: NSObject {
    
    static let FAV_STATION_KEY: String = "fav_station_key"
    
    static func save(key: String, value: [Int]) -> Bool {
        let preferences = UserDefaults.standard
        preferences.set(value, forKey: key)
        return preferences.synchronize()
    }
    
    static func get(key: String) -> [Int]{
        let preferences = UserDefaults.standard
    
        if preferences.object(forKey: key) == nil {
            return []
        } else {
            return preferences.object(forKey: key) as! [Int]
        }
    }
    
    
}
