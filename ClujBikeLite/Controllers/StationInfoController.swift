//
//  SettingControllerViewController.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/13/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import MapKit
import UIKit

class StationInfoController: UIViewController, MKMapViewDelegate {

    var bikesNumber: Int?
    var parkingsNumber: Int?
    var latitude: Double?
    var longitude: Double?
    var id: Int?

    let bikesLabel: UITextView = {
        let bl = UITextView()
        bl.text = "Bikes 0"
        bl.textColor = UIColor.white
        bl.textContainerInset = UIEdgeInsetsMake(10, 16, 10, 0);
        bl.font = UIFont.systemFont(ofSize: 23)
        bl.backgroundColor = UIColor.mainColor()
        return bl
    }()
    
    let parkingLabel: UITextView = {
        let pl = UITextView()
        pl.text = "Parkings 10"
        pl.font = UIFont.systemFont(ofSize: 23)
        pl.textColor = UIColor.white
        pl.textContainerInset = UIEdgeInsetsMake(10, 16, 10, 0);
        pl.backgroundColor = UIColor.mainColor()
        return pl
    }()
    
    lazy var mapView: MKMapView = {
        let m = MKMapView(frame: view.frame)
        return m
    }()
    
    var rightSideOptionButton: UIBarButtonItem?
    
    var isFavourite: Bool = false;
    
    @objc func handleFavouriteClick(){
        var favouriteStationsId = Preferences.get(key: Preferences.FAV_STATION_KEY)
        if isFavourite {
            var i = 0;
            for f in favouriteStationsId{
                if f == self.id {
                    break
                }
                i = i + 1
            }
            favouriteStationsId.remove(at: i)
            rightSideOptionButton?.image = UIImage(named: "baseline_star_border_white_48pt_1x")
        } else {
            favouriteStationsId.append(self.id!)
            rightSideOptionButton?.image = UIImage(named: "baseline_star_white_48pt_1x")
        }
        if !Preferences.save(key: Preferences.FAV_STATION_KEY, value: favouriteStationsId){
            // error
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let favList = Preferences.get(key: Preferences.FAV_STATION_KEY)
        isFavourite = favList.contains(where: { $0 == self.id })
        
        rightSideOptionButton = UIBarButtonItem(image: UIImage(named: "baseline_star_border_white_48pt_1x"), style: .plain, target: self, action: #selector(handleFavouriteClick))
        
        if isFavourite{
            rightSideOptionButton?.image = UIImage(named: "baseline_star_white_48pt_1x")
        }
        self.navigationItem.rightBarButtonItem = rightSideOptionButton
        if let bikes = bikesNumber {
            bikesLabel.text = "Bikes \(bikes)"
        }
        if let parkings = parkingsNumber {
            parkingLabel.text = "Parkings \(parkings)"
        }
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(bikesLabel)
        view.addSubview(parkingLabel)
        view.addSubview(mapView)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: bikesLabel)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: parkingLabel)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: mapView)
        view.addConstraintsWithFormat(format: "V:|[v0(50)][v1(50)][v2]|", views: bikesLabel,parkingLabel,mapView)
        
        addPinToMap()
    }
    
    func addPinToMap(){
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!);
        myAnnotation.title = "loc"
        let pinToZoomOn = myAnnotation
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: pinToZoomOn.coordinate, span: span)
        self.mapView.setRegion(region, animated: true)
        self.mapView.addAnnotation(myAnnotation)
    }



}
