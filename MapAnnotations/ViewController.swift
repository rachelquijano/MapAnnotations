//
//  ViewController.swift
//  MapAnnotations
//
//  Created by Rachel Quijano
//

import UIKit

// Map functionality
import MapKit

// Locations
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    // map variable
    let map = MKMapView()
    
    // custom coordinate
    let coordinate = CLLocationCoordinate2D(latitude: 40.728, longitude: -74)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // creates the map as a subview of the main view on storyboard
        view.addSubview(map)
        
        // chooses the size of the map
        map.frame = view.bounds
        
        // span = how far should the map camera show ?
        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: false)
        
        
        // ????? not sure what this does
        map.delegate = self
        
        //Add a pin to the map
        addCustomPin()
    }
    
    // Holds data for pin
    private func addCustomPin(){
        // use mkpointannotation to only display the title string at specified point
        let pin = MKPointAnnotation()
        
        pin.coordinate = coordinate
        pin.title = "Lionfish Here"
        pin.subtitle = "Verified Lionfish Location"
        
        // adds the created pin to the map.
        map.addAnnotation(pin)
    }

    // Creates a view for the given annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // pin annotation is not the user's current location
        guard !(annotation is MKUserLocation) else{
            return nil
        }
        
        // creating a custom annotation view
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
    
        if annotationView == nil {
            // create the view
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            
            // ???? not sure what this does either
            annotationView?.canShowCallout = true
            
            // customize further here as needed
            
            // example thing to add: annotationView?.rightAnchor
            
            
        }else{
            // sets the view's annotaton to the annotation passed into the method
            annotationView?.annotation = annotation
        
        }
        
        annotationView?.image = UIImage(named: "lionfish")
        
            
        return annotationView
    }

}

