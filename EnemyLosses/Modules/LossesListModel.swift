//
//  LossesListModel.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 04.07.2022.
//

import Foundation

protocol LossesListModel{
    func loadCurrentTechniqueLosses()
    func loadCurrentHumanLosses()
}

protocol LossesListModelDelegate: AnyObject {
    
}

class LossesListModelImplementation: LossesListModel {
    weak var delegate: LossesListModelDelegate?
    
    func loadCurrentTechniqueLosses() {
        guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let decoder = JSONDecoder()
            guard let data = data else {
                return
            }
            do {
                guard  let string = String(data: data, encoding: .utf8) else {
                    return
                }
                let replaced = string.replacingOccurrences(of: "NaN", with: "null")
                guard let dataFromString = replaced.data(using: .utf8) else {
                    return
                }
                let techniques = try decoder.decode([Technique].self, from: dataFromString)
                print("\(techniques)")
            } catch {
                print("erors \(error)")
                return
            }
        }
        task.resume()
    }
    
    func loadCurrentHumanLosses() {
        guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let decoder = JSONDecoder()
            guard let data = data else {
                return
            }
            do {
                let humans = try decoder.decode([Human].self, from: data)
                print("\(humans)")
            } catch {
                print("errors \(error)")
            }
        }
        
        task.resume()
        
    }
    
    
}
