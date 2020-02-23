//
//  ProvinceModel.swift
//  OngkirCheckerProject
//
//  Created by Bill Tanthowi Jauhari on 22/02/20.
//  Copyright © 2020 TechnologueID. All rights reserved.
//

import Foundation

struct ProvinceResultModel: Codable {
    let province_id: String
    let province: String
    
    enum CodingKeys: String, CodingKey {
        case province_id = "province_id"
        case province = "province"
    }
}
