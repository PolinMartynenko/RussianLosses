//
//  LabledImageView.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 18.07.2022.
//

import Foundation
import UIKit

class LabeledImageView : UIView {
    
    let labeledStackView = UIStackView()
    let labeledImageView = UIImageView()
    let labeledTitle = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setUpLabeledStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLabeledStackView(){
        labeledStackView.axis = .horizontal
        labeledStackView.spacing = 10
        labeledStackView.alignment = .center
        self.addSubview(labeledStackView)
        labeledStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labeledStackView.topAnchor.constraint(equalTo: topAnchor),
            labeledStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labeledStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labeledStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        setUpLabeledImageView()
        setUpletLabeledTitle()
    }
    
    private func setUpLabeledImageView(){
        labeledImageView.contentMode = .scaleAspectFit
        labeledStackView.addArrangedSubview(labeledImageView)
        NSLayoutConstraint.activate([
            labeledImageView.heightAnchor.constraint(equalToConstant: 30),
            labeledImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    private func setUpletLabeledTitle(){
        labeledTitle.contentMode = .scaleAspectFit
        labeledTitle.font = UIFont.boldSystemFont(ofSize: 17)
        
        labeledStackView.addArrangedSubview(labeledTitle)
        labeledTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labeledTitle.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
}
    

