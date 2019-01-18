//
//  MapCell.swift
//  
//
//  Created by Zsebe Akos on 1/10/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit
import MapKit

class MapCell: BaseCell,MKMapViewDelegate {
    
    var stations: [Station]?
    lazy var mapView: MKMapView = {
        let m = MKMapView(frame: frame)
        return m
    }()
    
    override func setupViews() {
        super.setupViews()
    
        addSubview(mapView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: mapView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: mapView)
        fetchVideos()
    }
    
    
    func fetchVideos(){
        ApiService.sharedInstance.getStations(complition: {(stations: [Station]) in
            self.stations = stations
            for station in stations {
                let myAnnotation: MKPointAnnotation = MKPointAnnotation()
                myAnnotation.coordinate = CLLocationCoordinate2DMake(station.latitude!, station.longitude!);
                myAnnotation.title = station.stationName
                self.mapView.addAnnotation(myAnnotation)
            }
            let myAnnotation: MKPointAnnotation = MKPointAnnotation()
            myAnnotation.coordinate = CLLocationCoordinate2DMake(46.770439, 23.591423);
            let pinToZoomOn = myAnnotation
            let span = MKCoordinateSpanMake(0.06, 0.06)
            let region = MKCoordinateRegion(center: pinToZoomOn.coordinate, span: span)
            self.mapView.setRegion(region, animated: true)
            
        })
    }
    
}
