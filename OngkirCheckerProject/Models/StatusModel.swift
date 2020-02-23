//
//  StatusModel.swift
//  OngkirCheckerProject
//
//  Created by Bill Tanthowi Jauhari on 23/02/20.
//  Copyright © 2020 TechnologueID. All rights reserved.
//

import Foundation

struct StatusModel: Codable {
    let code: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case description = "description"
    }
}
