//
//  Human.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 06.07.2022.
//

import Foundation

struct Human : Codable {
    let date : String
    let day : Int?
    let personnel : Int?
    let personnels : String?
    let POW : Int?
    
    enum CodingKeys: String, CodingKey {
        case date 
        case day
        case personnel
        case personnels = "personnel*"
        case POW
    }
}
