//
//  Host.swift
//  OngkirCheckerProject
//
//  Created by Bill Tanthowi Jauhari on 22/02/20.
//  Copyright © 2020 TechnologueID. All rights reserved.
//

import Foundation

class Router {
    
    var http = HttpUrlRequest(host: RajaOngkir.mainHost.rawValue)
    
    public func getProvince()
    {
        http.callApi(path: RajaOngkir.provincePath.rawValue)
    }
    
    public func getCity(province_id: Int)
    {
        http.callApi(path: RajaOngkir.cityPath.rawValue + "?province=" + String(province_id))
    }
}
