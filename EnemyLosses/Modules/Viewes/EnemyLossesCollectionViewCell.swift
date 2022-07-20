//
//  EnemyLossesCollectionViewCell.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 16.07.2022.
//

import Foundation
import UIKit

class EnemyLossesCollectionViewCell : UICollectionViewCell {
    let listLabel = UILabel()
    let humanView = LabeledImageView()
    let techniqueView = LabeledImageView()
    let stackView = UIStackView()
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setUpLable()
//        setUpHumanStackView()
//        setUpTechniqueStackView()
        setUpStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLable(){
//        listLabel.text = entry.text
        listLabel.numberOfLines = 0
        listLabel.font = UIFont.boldSystemFont(ofSize: 17)
        self.contentView.addSubview(listLabel)
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
    }
    
    private func setUpStackView(){
        stackView.axis = .horizontal
        stackView.backgroundColor = .yellow
        stackView.spacing = 10
        stackView.alignment = .center
        self.contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: listLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        setUpHumanView()
        setUpTechniqueView()
        
        
    }
    
    private func setUpHumanView(){
        stackView.addArrangedSubview(humanView)
        humanView.labeledImageView.image = UIImage(named: "man")
        humanView.backgroundColor = .green
    }
    
    private func setUpTechniqueView(){
        stackView.addArrangedSubview(techniqueView)
        techniqueView.labeledImageView.image = UIImage(named: "tank")
        techniqueView.backgroundColor = .red
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
