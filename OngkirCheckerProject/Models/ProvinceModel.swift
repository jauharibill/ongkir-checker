//
//  RajaOngkir.swift
//  OngkirCheckerProject
//
//  Created by Bill Tanthowi Jauhari on 23/02/20.
//  Copyright © 2020 TechnologueID. All rights reserved.
//

import Foundation

struct ProvinceModel: Codable {
    let rajaongkir: ProvinceDataModel
}

struct ProvinceDataModel: Codable {
    let query: [String]
    let status: StatusModel
    let results: [ProvinceResultModel]

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case results = "results"
        case query = "query"
    }

}
