import MapKit
import Foundation
import UIKit

class MapViewController : UIViewController {
    
    func mapCafes() {
        DispatchQueue.main.async {
            Cafee.shareData.forEach { (cafe) in
                let annotation = MKPointAnnotation()
                annotation.title = cafe.name
                annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double(cafe.latitude!)!), longitude: CLLocationDegrees(Double(cafe.longitude!)!))
                self.mapView.addAnnotation(annotation)
            }
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchItems()
        mapCafes()
        
        mapView.delegate = self as? MKMapViewDelegate

        // center the location on the screen
        let initialLocation = CLLocationCoordinate2D(latitude: 23.5, longitude: 121)

        mapView.setCenter(initialLocation, animated: true)
    }
}
