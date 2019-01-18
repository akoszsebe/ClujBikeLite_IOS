//
//  ColorResources.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/12/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

extension UIColor{
    
    static func mainColor() -> UIColor{
        return UIColor(hexString: "#1976d2")
    }
    
    static func mainColorDark() -> UIColor{
        return UIColor(hexString: "#004ba0")
    }
    
    static func mainTextColor() -> UIColor{
        return UIColor(hexString: "#ffffff")
    }
    
    static func tabBarTextColor() -> UIColor{
        return UIColor(hexString: "#ffffff", alpha: 0.6)
    }
    
    static func horizontalBarColor() -> UIColor{
        return UIColor(hexString: "#63a4ff")
    }
    
    static func colorActive() -> UIColor{
        return UIColor(hexString: "#1cbb9b")
    }
    
    static func colorLightBlue() -> UIColor{
        return UIColor(hexString: "#64a3fe")
    }
    
    static func colorUnderpopulated() -> UIColor{
        return UIColor(hexString: "#3598db")
    }
    
    static func colorSuprapopulated() -> UIColor{
        return UIColor(hexString: "#e84c3d")
    }
    
    static func colorOffline() -> UIColor{
        return UIColor(hexString: "#96a4a5")
    }
    
    static func colorNotWorking() -> UIColor{
        return UIColor(hexString: "#f2c311")
    }
}
