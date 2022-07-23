//
//  LossesListModel.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 04.07.2022.
//

import Foundation

protocol LossesListModel{
    func loadData()
}

protocol LossesListModelDelegate: AnyObject {
    func didLoadData(result: [(Human, Technique)])
}

class LossesListModelImplementation: LossesListModel {
    weak var delegate: LossesListModelDelegate?
    
    func loadData() {
        loadCurrentTechniqueLosses(completion: { [weak self] techniques in
            guard let self = self else { return }
            
            self.loadCurrentHumanLosses(completion: { [self] humans in
                print("\(humans.count)")
                print("\(techniques.count)")
                let result = Array(zip(humans, techniques))
                let reversed = Array(result.reversed())
                
                DispatchQueue.main.async {
                    self.delegate?.didLoadData(result: reversed)
                }
            })
        })
        
    }
    
    private func loadCurrentTechniqueLosses(completion: @escaping ([Technique]) -> Void) {
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
                completion(techniques)
            } catch {
                print("erors \(error)")
                return
            }
        }
        task.resume()
    }
    
    private func loadCurrentHumanLosses(completion: @escaping ([Human]) -> Void) {
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
                completion(humans)
            } catch {
                print("errors \(error)")
            }
        }
        
        task.resume()
        
    }
    
}
