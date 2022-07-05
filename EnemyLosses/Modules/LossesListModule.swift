//
//  LossesListModule.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 04.07.2022.
//

import Foundation
import UIKit

struct LossesListModule {
    static func build() -> UIViewController {
        let m = LossesListModelImplementation()
        let vm = LossesListViewModelImplementation(model: m)
        let vc = LossesListViewController(viewModel: vm)
        m.delegate = vm
        vm.delegate = vc
        return vc
    }
}
