//
//  EnemyLossesCollectionViewCell.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 16.07.2022.
//

import Foundation
import UIKit

class EnemyLossesCollectionViewCell : UICollectionViewCell {
    let listLable = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setUpLable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLable(){
//        listLabel.text = entry.text
        listLable.numberOfLines = 0
        listLable.font = UIFont.boldSystemFont(ofSize: 17)
        self.contentView.addSubview(listLable)
        listLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listLable.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
//    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
//
//            return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
//
//             switch sectionNumber {
//
//             case 0: return self.firstLayoutSection()
//             case 1: return self.secondLayoutSection()
//             default: return self.thirdLayoutSection()
//             }
//           }
//        }
    
   
    
}
