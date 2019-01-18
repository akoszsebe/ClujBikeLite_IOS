//
//  BaseStationCell.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/12/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

class BaseStationCell :BaseCell,UICollectionViewDataSource,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    let STATION_CELL_ID = "station_cell_id"
    var stations: [Station]?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var homeController: HomeController?
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(BaseStationCell.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        fetchVideos()
    }
    
    func fetchVideos(){
    }
    
    override func setupViews() {
        super.setupViews()
        
        fetchVideos()
        
        collectionView.refreshControl = refreshControl
        addSubview(collectionView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(StationCell.self, forCellWithReuseIdentifier: STATION_CELL_ID)
    }
    
    func searchDo(text: String) {
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stations?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: STATION_CELL_ID, for: indexPath) as! StationCell
        cell.station = stations?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let station = self.stations![indexPath.item]
        self.homeController?.showControllerForItemInfo(station: station)
    }
    
}

