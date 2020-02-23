//
//  HttpRequest.swift
//  OngkirCheckerProject
//
//  Created by Bill Tanthowi Jauhari on 22/02/20.
//  Copyright © 2020 TechnologueID. All rights reserved.
//

import Foundation
import SwiftyJSON

class HttpUrlRequest {
    
    var dataSerialized: Any!
    var host: String!
    
    init(host: String) {
        self.host = host
    }
    
    public func callApi(path: String)
    {
        let url = URL(string: self.host + path)!
        
        var request = URLRequest(url: url)
        
        guard let deviceID = UIDevice.current.identifierForVendor?.uuidString else {
           return
        }
        
        request.addValue(RajaOngkir.apiKey.rawValue, forHTTPHeaderField: "key")
        request.addValue(deviceID, forHTTPHeaderField: "ios-key")

        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                guard let result = data else { return }
            
            do {
                
                if error != nil {
                    print(error)
            
                }
                
                let json = try JSONDecoder().decode(ProvinceModel.self, from: data! )
                let province = json.rajaongkir.results
                let provincePicker = OngkirView()
                
                for n in 1...province.count {
                    provincePicker.ProvinceData.append(province[n].province)
                }
        
            } catch {
                print("error", error)
            }
            
        }

        task.resume()
    }
    
    public func getData() -> Any
    {
        return self.dataSerialized
    }
}
