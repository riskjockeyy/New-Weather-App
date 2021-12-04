//
//  ContentModel.swift
//  New Weather App
//
//  Created by Bharat Singh on 04/12/21.
//

import Foundation
import CoreLocation

class ContentModel: NSObject ,ObservableObject, CLLocationManagerDelegate {
    
    @Published var response : Response?
    
    let locationManager = CLLocationManager()
    
   override init () {
        
       super.init()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
       
       
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            
            // we do not have location permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.first
        
        if userLocation != nil {
            
            locationManager.stopUpdatingLocation()
            getLocation(location: userLocation!)
            
        }
    }
    
    func getLocation(location:CLLocation) {
        
        var urlComponent = URLComponents(string: Constant.url)
        
        urlComponent?.queryItems = [URLQueryItem(name: "lat", value: String(location.coordinate.latitude)),
                                    URLQueryItem(name: "lon", value: String(location.coordinate.longitude)),
                                  
                                    URLQueryItem(name: "appid", value: Constant.api_key)]
        
        let url = urlComponent?.url
        
        if let url = url {
            
            let request = URLRequest(url: url)
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                if error == nil && data != nil {
                    
                    do {
                        let decoder = JSONDecoder()
                        
                        let result = try decoder.decode(Response.self, from: data!)
                        
                        DispatchQueue.main.async {
                            self.response = result
                            
                        }
                        
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                    
                }
            }
            dataTask.resume()
        }
    }
}
