//
//  LossesListModule.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 04.07.2022.
//

import Foundation
import UIKit

struct LossesDetailsModule {
    static func build(_ losses: (Human, Technique)) -> UIViewController {
        // TODO: - Setup MVVM module
        let vc = LossesDetailsViewController(losses: losses)
        return vc
    }
}
