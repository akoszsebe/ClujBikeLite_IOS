//
//  ApiService.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/11/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()

    public func getStations(complition: @escaping ([Station]) -> ()){
        let url = NSURL(string: "http://portal.clujbike.eu/Station/Read")
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "POST"
        let postString = "postDataKey=value"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request){ (data,response, error) in
            if error != nil {
                print(error ?? "")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!,options: []) as? NSDictionary
                
                var stations = [Station]()
                
                for dictionary in json!["Data"] as! [[String: AnyObject]] {
                    let station = Station()
                    station.address = dictionary["Address"] as? String
                    station.stationName = dictionary["StationName"] as? String
                    station.customIsValid = dictionary["CustomIsValid"] as? Bool
                    station.emptySpots = dictionary["EmptySpots"] as? Int
                    station.id = dictionary["Id"] as? Int
                    station.idStatus = dictionary["IdStatus"] as? Int
                    station.isValid = dictionary["IsValid"] as? Bool
                    station.lastSyncDate = dictionary["LastSyncDate"] as? String
                    station.latitude = dictionary["Latitude"] as? Double
                    station.longitude = dictionary["Longitude"] as? Double
                    station.maximumNumberOfBikes = dictionary["MaximumNumberOfBikes"] as? Int
                    station.ocuppiedSpots = dictionary["OcuppiedSpots"] as? Int
                    station.status  = dictionary["Status"] as? String
                    station.statusType = dictionary["StatusType"] as? String
                    stations.append(station)
                }
                DispatchQueue.main.async(execute: {
                    complition(stations)
                })
                
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }
}
