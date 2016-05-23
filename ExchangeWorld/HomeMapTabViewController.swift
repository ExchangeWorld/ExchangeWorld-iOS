//
//  HomeMapTabViewController.swift
//  ExchangeWorld
//
//  Created by 盧與明 on 2016/5/16.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeMapTabViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
        let camera = GMSCameraPosition.cameraWithLatitude(24.987574,
                                                          longitude: 121.575774, zoom: 16)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(24.987574, 121.575774)
        marker.title = "Taipei"
        marker.snippet = "NCCU"
        marker.map = mapView
    }
}

