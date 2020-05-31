//
//  MapViewController.swift
//  Qoima
//
//  Created by root user on 5/17/20.
//  Copyright © 2020 iitu. All rights reserved.
//
import GoogleMaps
import UIKit
import EasyPeasy

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate, UISearchBarDelegate{

    var list = [Qoima]()
    var zoom: Float = 16.0
    let locationManager = CLLocationManager()
    var mapView: GMSMapView!
    var seachBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        self.seachBar.delegate = self
        self.view.addSubview(seachBar)
        seachBar.easy.layout(Top(0), Left(0), Right(0))
        
        let image = #imageLiteral(resourceName: "toplogo-2")
        let imageV = UIImageView(frame: CGRect(x: 0, y: 5, width: 38, height: 20))
        imageV.contentMode = .scaleAspectFit
        imageV.image = image
        navigationItem.titleView = imageV
        
        self.getList()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self

        view.addSubview(mapView)
        mapView.easy.layout(Top(0).to(seachBar), Left(0), Right(), Bottom())
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
//        for i in self.list{
//            if i.id! == marker.iconView!.tag{
//                QoimaViewController.open(vc: self, item: i)
//                return
//            }
//        }
        
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
                    marker.accessibilityLabel = "\(item.id!)"
                    
                    self.locationManager.stopUpdatingLocation()
                }
            }
        }
    }
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.denied) {
            // The user denied authorization
        } else{
            self.locationManager.startUpdatingLocation()
            self.locationManager.stopUpdatingLocation()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        for i in self.list{
            if i.name!.contains(searchBar.text!){
                let l = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double(i.latitude!.filter(".1234567890".contains))!), longitude: CLLocationDegrees(Double(i.longitude!.filter(".1234567890".contains))!))
                let camera = GMSCameraPosition.camera(withLatitude: l.latitude, longitude: l.longitude, zoom: zoom)
                mapView.camera = camera
                mapView.animate(to: camera)
                break
            }
        }
    }
    
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let id = marker.accessibilityLabel
        for i in self.list{
            if "\(i.id ?? 0)" == id{
//                QoimaViewController.open(vc: self, item: i)
                break
            }
        }
        return true
    }
}
