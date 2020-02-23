//
//  QueryProvinceModel.swift
//  OngkirCheckerProject
//
//  Created by Bill Tanthowi Jauhari on 23/02/20.
//  Copyright © 2020 TechnologueID. All rights reserved.
//

import Foundation

struct QueryProvinceModel: Codable {
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}
