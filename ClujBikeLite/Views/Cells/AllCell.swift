//
//  AllCell.swift
//  
//
//  Created by Zsebe Akos on 1/10/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

class AllCell: BaseStationCell {
    override func fetchVideos(){
        ApiService.sharedInstance.getStations(complition: {(stations: [Station]) in
            self.stations = stations
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
        })
    }
}
