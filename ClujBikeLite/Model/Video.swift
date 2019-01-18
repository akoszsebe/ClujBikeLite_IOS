//
//  Video.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/11/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

@objcMembers
class Video: NSObject {
    
    
    var title: String?
    var thumbnail_image_name: String?
    var number_of_views: NSNumber?
    var uploadDate: NSDate?
    var duration: NSNumber?
    
    var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        
    }
}
