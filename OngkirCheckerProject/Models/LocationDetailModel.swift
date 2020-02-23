//
//  OriginDetailModel.swift
//  OngkirCheckerProject
//
//  Created by Bill Tanthowi Jauhari on 23/02/20.
//  Copyright © 2020 TechnologueID. All rights reserved.
//

import Foundation

struct LocationDetailModel: Codable {
    let city_id: String
    let province_id: String
    let province: String
    let type: String
    let city_name: String
    let postal_code: String
}
