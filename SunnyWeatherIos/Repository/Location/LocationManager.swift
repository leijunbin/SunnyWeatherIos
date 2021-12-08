//
//  LocationService.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/8.
//

import Foundation
import CoreLocation
import RxSwift
import RxCoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate{
    
    private let locationManager = CLLocationManager()
    private var lat: Double = 0.0
    private var lon: Double = 0.0
    
    func getLocation() -> Observable<CLLocation?>{
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        return locationManager.rx
            .location
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{
            return
        }
        lat = Double(String(format: "%.6f", location.coordinate.latitude )) ?? 0.00
        lon = Double(String(format: "%.6f", location.coordinate.longitude)) ?? 0.00
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Something went wrong with location.")
    }
}
