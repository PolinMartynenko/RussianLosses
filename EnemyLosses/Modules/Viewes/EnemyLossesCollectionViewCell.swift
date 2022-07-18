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
    let humanImageView = UIImageView(image: UIImage(named: "man"))
    let humanStackView = UIStackView()
    let numberOfHumanLabel = UILabel()
    let techniqueStackView = UIStackView()
    let techniqueImageView = UIImageView(image: UIImage(named: "tank"))
    let numberOfTechniqueLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setUpLable()
        setUpHumanStackView()
        setUpTechniqueStackView()
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
    
    private func setUpHumanStackView(){
        humanStackView.axis = .horizontal
        humanStackView.backgroundColor = .green
        humanStackView.spacing = 10
        humanStackView.alignment = .center
        self.contentView.addSubview(humanStackView)
        humanStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            humanStackView.topAnchor.constraint(equalTo: listLabel.bottomAnchor, constant: 10),
            humanStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
        
        setUpHumanImageView()
        setUpNumberOfHumanLabel()
    }
    
    private func setUpHumanImageView(){
        humanImageView.contentMode = .scaleAspectFit
        humanStackView.addArrangedSubview(humanImageView)
        NSLayoutConstraint.activate([
            humanImageView.heightAnchor.constraint(equalToConstant: 30),
            humanImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    private func setUpNumberOfHumanLabel(){
        numberOfHumanLabel.contentMode = .scaleAspectFit
        numberOfHumanLabel.font = UIFont.boldSystemFont(ofSize: 17)
        numberOfHumanLabel.text = "ffbh"
        humanStackView.addArrangedSubview(numberOfHumanLabel)
        numberOfHumanLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfHumanLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setUpTechniqueStackView(){
        techniqueStackView.axis = .horizontal
        techniqueStackView.backgroundColor = .red
        techniqueStackView.spacing = 10
        techniqueStackView.alignment = .center
        self.contentView.addSubview(techniqueStackView)
        techniqueStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            techniqueStackView.topAnchor.constraint(equalTo: listLabel.bottomAnchor, constant: 10),
            techniqueStackView.leadingAnchor.constraint(equalTo: humanStackView.trailingAnchor, constant: 10),
            techniqueStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
        setUpTechniqueImageView()
        setUpNumberOfTechniqueLabel()
    }
    
    private func setUpTechniqueImageView(){
        techniqueImageView.contentMode = .scaleAspectFit
        techniqueStackView.addArrangedSubview(techniqueImageView)
        NSLayoutConstraint.activate([
            techniqueImageView.heightAnchor.constraint(equalToConstant: 30),
            techniqueImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    private func setUpNumberOfTechniqueLabel(){
        numberOfTechniqueLabel.contentMode = .scaleAspectFit
        numberOfTechniqueLabel.font = UIFont.boldSystemFont(ofSize: 17)
        numberOfTechniqueLabel.text = "fffse"
        techniqueStackView.addArrangedSubview(numberOfTechniqueLabel)
        numberOfTechniqueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfTechniqueLabel.heightAnchor.constraint(equalToConstant: 20)
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
