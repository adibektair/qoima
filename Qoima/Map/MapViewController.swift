//
//  MapViewController.swift
//  Qoima
//
//  Created by root user on 5/17/20.
//  Copyright © 2020 iitu. All rights reserved.
//
import GoogleMaps
import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate{

    var list = [Qoima]()
    var zoom: Float = 16.0
    let locationManager = CLLocationManager()
    var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
        self.getList()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self

        view = mapView
        // Do any additional setup after loading the view.
    }
    let myMarker = GMSMarker()

     func loadView(longitude: CLLocationDegrees, latitude: CLLocationDegrees) {
            
    //        self.mapView.clear()
            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: zoom)
            mapView.camera = camera
            mapView.animate(to: camera)
            
            myMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            myMarker.title = "Вы"
            myMarker.snippet = "Тут"
//            marker.zIndex = 0
            myMarker.zIndex = 100;
            myMarker.map = mapView
            self.locationManager.stopUpdatingLocation()
//            self.setNavBlue()

            
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            self.loadView(longitude: locValue.longitude, latitude: locValue.latitude)
            print("locations = \(locValue.latitude) \(locValue.longitude)")
        }


    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        for i in self.list{
            if i.id! == marker.iconView!.tag{
                QoimaViewController.open(vc: self, item: i)
                return
            }
        }
        
    }
    func getList(){
        NetworkLayer.shared().getQoimaList { (response) in
            if response != nil{
                self.list = response!.qoima!
                for item in response!.qoima!{
             
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double(item.latitude!.filter(".1234567890".contains))!), longitude: CLLocationDegrees(Double(item.longitude!.filter(".1234567890".contains))!))
                    marker.title = item.name!
                    marker.snippet = item.descriptionField!
                    marker.icon = #imageLiteral(resourceName: "Stock")
                    marker.zIndex = 100;
                    marker.map = self.mapView
                    
                    
                    self.locationManager.stopUpdatingLocation()
                }
            }
        }
    }

}
