//
//  ViewController.swift
//  1106_ExercicioMapView
//
//  Created by Jorge Roberto on 06/11/20.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        
        let location = CLLocation(latitude: -10.946477, longitude: -37.072436)
        let customLocation = CustomLocation(coordinate: location.coordinate,
                                                    title: "Casa de Tia Lucia",
                                                    subtitle: "SUBTITULO",
                                                    category: "CATEGORIA")
                
                
                
                mapView.addAnnotation(customLocation)
        //        mapView.removeAnnotations(mapView.annotations)
        //        mapView.addAnnotations(array)
                centerMapOn(location: location)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationAuthorizationStatus()
    }
    
    let locationManager = CLLocationManager()

        func checkLocationAuthorizationStatus() {
            locationManager.delegate = self
            locationManager.startUpdatingLocation()

            if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                mapView.showsUserLocation = true
            } else {
                locationManager.requestWhenInUseAuthorization()
            }
        }
    
    func centerMapOn(location: CLLocation) {
        let region = MKCoordinateRegion(center: location.coordinate,
                                        latitudinalMeters: 1000,
                                        longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
}


extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        checkLocationAuthorizationStatus()
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is CustomLocation else { return nil }

        let indentifier = "marker"

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: indentifier)

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: indentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("clicou")
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("selecionado")
        if let annotation = view.annotation as? CustomLocation {
            print(annotation.category ?? "")
        }
    }
}
