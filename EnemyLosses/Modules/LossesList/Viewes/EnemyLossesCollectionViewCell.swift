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
    let separartorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setUpLable()
        setUpStackView()
        setUpSeparator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLable(){
        listLabel.font = UIFont.boldSystemFont(ofSize: 17)
        self.contentView.addSubview(listLabel)
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setUpStackView(){
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .leading
        self.contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: listLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
        ])
        
        setUpHumanView()
        setUpTechniqueView()
    }
    
    private func setUpHumanView(){
        stackView.addArrangedSubview(humanView)
        humanView.labeledImageView.image = UIImage(named: "man")
    }
    
    private func setUpTechniqueView(){
        stackView.addArrangedSubview(techniqueView)
        techniqueView.labeledImageView.image = UIImage(named: "tank")
    }
    
    private func setUpSeparator() {
        separartorView.backgroundColor = .systemGray5
        addSubview(separartorView)
        separartorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separartorView.heightAnchor.constraint(equalToConstant: 1),
            separartorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separartorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separartorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
