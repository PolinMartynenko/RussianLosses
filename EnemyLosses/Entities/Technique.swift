//
//  Technique.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 05.07.2022.
//

import Foundation

struct Technique: Codable {
    let date : String
    let day : Int?
    let aircraft : Int?
    let helicopter : Int?
    let tank : Int?
    let APC : Int?
    let fieldArtillery : Int?
    let MRL : Int?
    let militaryAuto : Int?
    let fuelTank : Int?
    let drone : Int?
    let navalShip : Int?
    let antiAircraftWarfare : Int?
    let specialEquipment : Int?
    let mobileSRBMSystem : Int?
    let vehiclesAndFuelTanks : Int?
    let cruiseMissiles : Int?

    enum CodingKeys: String, CodingKey {
        case date
        case day
        case aircraft
        case helicopter
        case tank
        case APC
        case fieldArtillery = "field artillery"
        case MRL
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.day = Technique.decodeIntOrString(key: .day, container: container)
        self.aircraft = Technique.decodeIntOrString(key: .aircraft, container: container)
        self.helicopter = Technique.decodeIntOrString(key: .helicopter, container: container)
        self.tank = Technique.decodeIntOrString(key: .tank, container: container)
        self.APC = Technique.decodeIntOrString(key: .APC, container: container)
        self.fieldArtillery = Technique.decodeIntOrString(key: .fieldArtillery, container: container)
        self.MRL = Technique.decodeIntOrString(key: .MRL, container: container)
        self.militaryAuto = Technique.decodeIntOrString(key: .militaryAuto, container: container)
        self.fuelTank = Technique.decodeIntOrString(key: .fuelTank, container: container)
        self.drone = Technique.decodeIntOrString(key: .drone, container: container)
        self.navalShip = Technique.decodeIntOrString(key: .navalShip, container: container)
        self.antiAircraftWarfare = Technique.decodeIntOrString(key: .antiAircraftWarfare, container: container)
        self.specialEquipment = Technique.decodeIntOrString(key: .specialEquipment, container: container)
        self.mobileSRBMSystem = Technique.decodeIntOrString(key: .mobileSRBMSystem, container: container)
        self.vehiclesAndFuelTanks = Technique.decodeIntOrString(key: .vehiclesAndFuelTanks, container: container)
        self.cruiseMissiles = Technique.decodeIntOrString(key: .cruiseMissiles, container: container)
        
        
    }
    
    static func decodeIntOrString(key: CodingKeys, container: KeyedDecodingContainer<CodingKeys>) -> Int? {
        if let value = try? container.decode(Int?.self, forKey: key) {
            return value
        } else if let value = try? container.decode(String?.self, forKey: key) {
            return Int(value)
        } else {
            return 0
        }
    }
}
