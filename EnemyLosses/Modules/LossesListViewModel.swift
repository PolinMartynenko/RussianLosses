//
//  LossesListViewModel.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 04.07.2022.
//

import Foundation

protocol LossesListViewModel {
    func onViewDidLoad()
    var losses : [(Human, Technique)] {get}
}

protocol LossesListViewModelDelegate: AnyObject {
    
}



class LossesListViewModelImplementation: LossesListViewModel {
    var model: LossesListModel
    weak var delegate: LossesListViewModelDelegate?
    var losses : [(Human, Technique)] = []
    
    init(model:LossesListModel){
        self.model = model
    }
    
    func onViewDidLoad() {
        model.loadData()
    }
}

extension LossesListViewModelImplementation: LossesListModelDelegate {
    func didLoadData(result: [(Human, Technique)]) {
        losses = result
    }
}
