//
//  ViewController.swift
//  TestProj
//
//  Created by LEONG YI MEI on 03/08/2021.
//

import UIKit
import MapKit
import CoreLocation

class CalloutAnnotation: MKMarkerAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        canShowCallout = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!

    let oneUtamaCoordinates = CLLocationCoordinate2D(latitude: 3.150182048202148, longitude: 101.61576199727313)
    let ikeaCoordinates = CLLocationCoordinate2D(latitude: 3.1575094571477447, longitude: 101.61319780558786)

    var locationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        getCurrentLocation()

        mapView.register(CalloutAnnotation.self, forAnnotationViewWithReuseIdentifier: "CalloutAnnotation")
        mapView.delegate = self

        addPin()
    }

    func getCurrentLocation() {
        locationManager.delegate = self

        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func addPin() {
        let oneUtamaPin = MKPointAnnotation()
        oneUtamaPin.coordinate = oneUtamaCoordinates
        oneUtamaPin.title = "One Utama"
        oneUtamaPin.subtitle = "Very big shopping mall"

//        let oneUtamaRegion = MKCoordinateRegion(center: oneUtamaCoordinates, latitudinalMeters: 800, longitudinalMeters: 800)
//
//        mapView.setRegion(oneUtamaRegion, animated: true)

        let ikeaPin = MKPointAnnotation()
        ikeaPin.coordinate = ikeaCoordinates
        ikeaPin.title = "Ikea"
        ikeaPin.subtitle = "Ikea damansara"

        let listOfPins = [oneUtamaPin, ikeaPin]

        mapView.addAnnotations(listOfPins)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let currentPin = mapView.dequeueReusableAnnotationView(withIdentifier: "CalloutAnnotation")

        if annotation.coordinate.latitude == oneUtamaCoordinates.latitude {
            currentPin?.detailCalloutAccessoryView = UIImageView(image: UIImage(named: "OneUtama"))
        }

        if annotation.coordinate.latitude == ikeaCoordinates.latitude {
            currentPin?.detailCalloutAccessoryView = UIImageView(image: UIImage(named: "Ikea"))
        }

        return currentPin
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let currentLocation = locations.last

        

        /*//This chunk is for constant updating your current location
        let currentRegion = MKCoordinateRegion(center: currentLocation?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 800, longitudinalMeters: 800)

        mapView.setRegion(currentRegion, animated: true) */


    }
}


