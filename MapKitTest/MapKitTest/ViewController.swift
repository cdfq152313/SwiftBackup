//
//  ViewController.swift
//  MapKitTest
//
//  Created by denny on 10/21/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    let geoCoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    @IBAction func location(_ sender: AnyObject) {
        geoCoder.geocodeAddressString("100台北市中正區忠孝西路一段171號") {
            (places, error) in
            if error != nil{
                print ("Get position error")
            }
            else{
                if(places?.count)! > 0 {
                    let placeMark = places?.first
                    print("Location: \(placeMark?.location)")
                    
                    let annotation = MKPointAnnotation()
                    annotation.title = "Sandwitch"
                    annotation.subtitle = "Taipei good food"
                    annotation.coordinate = (placeMark?.location?.coordinate)!
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
    }
    
    @IBAction func directAction(_ sender: AnyObject) {
        let request = MKDirectionsRequest()
        
        let mylocation = locationManager.location
        
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: (mylocation?.coordinate)!, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 25.033408, longitude:121.56409 ), addressDictionary: nil) )
        request.requestsAlternateRoutes = false
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate {
            (response, error) in
            for route in (response?.routes)!{
                self.mapView.add(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: (userLocation.location?.coordinate)!, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005) )
        self.mapView.region = region
        mapView.region = region
        
        self.geoCoder.reverseGeocodeLocation(userLocation.location!) {
            (places, error) in
            if (places?.count)! > 0{
                let placeMark = places?.first
                for (key, value) in (placeMark?.addressDictionary)!{
                    print("key: \(key), value \(value)")
                }
                
                let addressArray = placeMark?.addressDictionary?["FormattedAddressLines"] as! [String]
                for address in addressArray{
                    print("Address: \(address)")
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifer = "MyPin"
        
        if annotation is MKUserLocation{
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifer) as? MKPinAnnotationView
        
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifer)
        }
        annotationView?.canShowCallout = true
        annotationView?.image = #imageLiteral(resourceName: "Tails")
        
        return annotationView
    }
}
