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
    
    var categoryAll: Category? {
        didSet {
            let camera = GMSCameraPosition.cameraWithLatitude(24.987574, longitude: 121.575774, zoom: 16)
            let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
            mapView.myLocationEnabled = true
            mapView.settings.compassButton = true
            mapView.settings.myLocationButton = true
            
            //self.map.camera = camera
            self.view = mapView
            
            for object in categoryAll!.objects {
                let marker = GMSMarker()

                marker.position = CLLocationCoordinate2DMake(object.position_y,object.position_x)
                marker.title = object.name
                marker.snippet = object.category
                marker.map = mapView
                marker.appearAnimation = kGMSMarkerAnimationPop
                
                print(marker)
            }
        }
    }
    
    var allData: ExchangeWorldCategoryDataSource? {
        didSet {
            guard let allData = self.allData else {
                //self.view.reloadInputViews()  該打什麼？
                return
            }
            allData.fetch{ (resultObjects: [Object]?) in
                guard let objects = resultObjects else {
                    let message = "Failed to fetch data."
                    let alertController = UIAlertController(title: message, message: nil, preferredStyle: .Alert)
                    let alertOK = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertController.addAction(alertOK)
                    self.presentViewController(alertController, animated: true, completion: nil)
                    return
                }
                print("hi")
                print(objects)
                self.categoryAll = Category(name: allData.categoryName, objects: objects)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.allData = ExchangeWorldCategoryDataSource(categoryName: "")
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
    
}

