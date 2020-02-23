//
//  CityModel.swift
//  OngkirCheckerProject
//
//  Created by Bill Tanthowi Jauhari on 22/02/20.
//  Copyright © 2020 TechnologueID. All rights reserved.
//

import Foundation

struct CityModel: Codable {
    let rajaongkir: CityDataModel
}

struct CityDataModel: Codable {
    let results: [CityResultModel]
    let query: QueryCityModel
    let status: StatusModel
}
