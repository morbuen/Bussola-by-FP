//
//  Location.swift
//  Bussola by FP
//
//  Created by Francesco Puzone on 20/06/22.
//

import Foundation
import CoreLocation
import SwiftUI

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        guard let location = locations.last else {
            return
        }
        self.location = location
    }
}

extension BinaryFloatingPoint {
    var dms: (degrees: Double, minutes: Double, seconds: Double) {
        var seconds = Double(self * 3600)
        let degrees = seconds / 3600
        seconds = seconds.truncatingRemainder(dividingBy: 3600)
        let minutes = seconds / 60
        seconds = seconds.truncatingRemainder(dividingBy: 60)
        return (degrees, minutes, seconds)
    }
}
extension CLLocationCoordinate2D {
    var latitudeDMS: String {
        let (degrees, minutes, seconds) = latitude.dms
        return String(format: "%.0f°%.0f'%.2f\"%@", abs(degrees), abs(minutes), abs(seconds), degrees >= 0 ? "N" : "S")
    }
    var longitudeDMS: String {
        let (degrees, minutes, seconds) = longitude.dms
        return String(format: "%.0f°%.0f'%.2f\"%@", abs(degrees), abs(minutes), abs(seconds), degrees >= 0 ? "E" : "W")
    }
}
