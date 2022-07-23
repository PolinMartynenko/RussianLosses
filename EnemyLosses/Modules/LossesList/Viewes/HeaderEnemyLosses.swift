//
//  HeaderEnemyLosses.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 20.07.2022.
//

import Foundation
import UIKit

class HeaderEnemyLosses : UICollectionReusableView {
    
    static let indentifier = "HeaderEnemyLosses"
    
    let totalListLabel = UILabel()
    let humanView = LabeledImageView()
    let techniqueView = LabeledImageView()
    let stackView = UIStackView()
    
    private let label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Total Russian losses"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = .white
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        backgroundColor = .systemGray4
        setUpHeader()
        setUpStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpHeader(){
        label.backgroundColor = .systemPink
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func setUpStackView(){
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
        ])
        
        setUpTotalViewHumanLosses()
        setUpTechniqueView()
    }
    
    private func setUpTotalViewHumanLosses() {
        stackView.addArrangedSubview(humanView)
        humanView.labeledImageView.image = UIImage(named: "man")
        humanView.labeledTitle.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private func setUpTechniqueView() {
        stackView.addArrangedSubview(techniqueView)
        techniqueView.labeledImageView.image = UIImage(named: "tank")
        techniqueView.labeledTitle.font = .systemFont(ofSize: 20, weight: .bold)
    }
}
