//
//  ViewController.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 04.07.2022.
//

import UIKit

class LossesListViewController: UIViewController {

    let viewModel: LossesListViewModel
    
    init(viewModel: LossesListViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        viewModel.onViewDidLoad()
    }


}

extension LossesListViewController: LossesListViewModelDelegate {
    
}
