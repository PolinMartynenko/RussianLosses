//
//  LossesListViewModel.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 04.07.2022.
//

import Foundation

protocol LossesListViewModel {
    func onViewDidLoad()
}

protocol LossesListViewModelDelegate: AnyObject {
    
}



class LossesListViewModelImplementation: LossesListViewModel {
    var model: LossesListModel
    weak var delegate: LossesListViewModelDelegate?
    
    init(model:LossesListModel){
        self.model = model
    }
    
    func onViewDidLoad() {
        model.loadCurrentTechniqueLosses()
        model.loadCurrentHumanLosses()
    }
    
    
}

extension LossesListViewModelImplementation: LossesListModelDelegate {
    
}
