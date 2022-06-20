//
//  CompassHeading.swift
//  Bussola by FP
//
//  Created by Francesco Puzone on 20/06/22.
//

import Foundation
import CoreLocation
import Combine

@objc class CompassHeading: NSObject, ObservableObject, CLLocationManagerDelegate {
    var objectWillChange = PassthroughSubject<Void, Never>()
    @objc dynamic var degrees: Double = .zero {
        didSet {
            objectWillChange.send()
        }
    }
    var direzione: String {
        if self.degrees < 22.5 {
            return String("N")
        } else if self.degrees < 67.5 {
            return String("NE")
        } else if self.degrees < 112.5 {
            return String("E")
        } else if self.degrees < 157.5 {
            return String("SE")
        } else if self.degrees < 202.5 {
            return String("S")
        } else if self.degrees < 247.5 {
            return String("SW")
        } else if self.degrees < 292.5 {
            return String("W")
        } else if self.degrees < 337.5 {
            return String("NW")
        } else if self.degrees >= 337.5 {
            return String("N")
        } else {
            return String("")
        }
    }
    
    private let locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        
        self.locationManager.delegate = self
        self.setup()
    }
    
    private func setup() {
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.headingAvailable() {
            self.locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.degrees = newHeading.magneticHeading
    }
}
