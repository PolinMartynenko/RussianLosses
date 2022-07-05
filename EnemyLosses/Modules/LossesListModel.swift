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
        
    }
    
    func loadCurrentHumanLosses() {
    }
    
    
}
