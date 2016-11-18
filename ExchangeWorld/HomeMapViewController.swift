//
//  HomeMapViewController.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/10/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeMapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    var categoryAll: Category? {
        didSet {
            let camera = GMSCameraPosition.camera(withLatitude: 24.987574, longitude: 121.575774, zoom: 16)
            let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            mapView.isMyLocationEnabled = true
            mapView.settings.compassButton = true
            mapView.settings.myLocationButton = true
            
//            self.map.camera = camera
            self.view = mapView
            
            for object in categoryAll!.objects {
                let marker = GMSMarker()
                
                marker.position = CLLocationCoordinate2DMake(object.position_y,object.position_x)
                marker.title = object.name
                marker.snippet = object.category
                marker.icon = UIImage(named: object.category)
                marker.icon = GMSMarker.markerImage(with: UIColor(red: 128.0/255.0, green: 192.0/255.0, blue: 189.0/255.0, alpha: 1.0))
                marker.map = mapView
                marker.appearAnimation = kGMSMarkerAnimationPop
                
                print(marker)
            }
        }
    }
    
    var allData: ExchangeWorldCategoryDataSource? {
        didSet {
            guard let allData = self.allData else {
//                self.view.reloadInputViews()
                return
            }
            allData.fetch{ (resultObjects: [Object]?) in
                guard let objects = resultObjects else {
                    let message = "Failed to fetch data."
                    let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
                    let alertOK = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(alertOK)
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                print(objects.count)
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
