//
//  ViewController.swift
//  1106_ExercicioMapView
//
//  Created by Jorge Roberto on 06/11/20.
//

//Crie um app que:
//Possua uma lista de várias localicações de lugares, com suas categorias.
//Ex: Supermercado Angeloni - MERCADO, Hotel Transilvânia - HOTEL
//Deve haver um filtro de categorias, de modo que o usuário possa filtrar entre as categorias.
//Quando filtrar a categoria, deve exibir no mapa todos os lugares correspondentes aquela categoria.

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        segmentedControl.setTitle("Hotel", forSegmentAt: 0)
        segmentedControl.setTitle("Supermercado", forSegmentAt: 1)
        segmentedControl.setTitle("Restaurante", forSegmentAt: 2)
        
        let location = CLLocation(latitude: -10.946477, longitude: -37.072436)
        let customLocation = CustomLocation(coordinate: location.coordinate, title: "Casa de Tia Lucia", subtitle: "SUBTITULO", category: "CATEGORIA")
                
                
                
        mapView.addAnnotation(customLocation)
        // mapView.removeAnnotations(mapView.annotations)
        // mapView.addAnnotations(array)
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
