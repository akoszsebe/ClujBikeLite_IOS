//
//  FavoritesCell.swift
//
//
//  Created by Zsebe Akos on 1/10/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

class FavoritesCell: BaseStationCell {
    
    override func fetchVideos(){
        ApiService.sharedInstance.getStations(complition: {(stations: [Station]) in
            self.stations = [Station]()
            
            let favouriteStationsId = Preferences.get(key: Preferences.FAV_STATION_KEY)
            for station in stations{
                if (favouriteStationsId.contains(station.id!)){
                    self.stations?.append(station)
                }
            }
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
        })
    }
}
