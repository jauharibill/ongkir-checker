//
//  CostModel.swift
//  OngkirCheckerProject
//
//  Created by Bill Tanthowi Jauhari on 23/02/20.
//  Copyright © 2020 TechnologueID. All rights reserved.
//

import Foundation

struct CostModel: Codable {
    let rajaongkir: CostDataModel
}

struct CostDataModel: Codable {
    let query: [String]
    let status: StatusModel
    let origin_details: LocationDetailModel
    let destination_details: LocationDetailModel
    let results: CostResultModel
}

struct CostResultModel: Codable {
    let code: String
    let name: String
    let costs: [ServiceCourierModel]
}

struct ServiceCourierModel: Codable {
    let service: String
    let description: String
    let cost: [CostServiceModel]
}

struct CostServiceModel: Codable {
    let value: Int
    let etd: String
    let note: String
}
