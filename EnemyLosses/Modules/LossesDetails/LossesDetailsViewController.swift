//
//  LossesDetails.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 23.07.2022.
//

import UIKit

class LossesDetailsViewController: UIViewController {
    var losses: (human: Human, techinque: Technique)
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let humanView = LabeledImageView()
    let leftStackView = UIStackView()
    let rightStackView = UIStackView()
    
    init(losses: (human: Human, techinque: Technique)) {
        self.losses = losses
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTitleLabel()
        setupDateLabel()
        setupHumanView()
        setUpLeftStackView()
        setUpRightStackView()
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "Russian losses at:"
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }

    private func setupDateLabel() {
        dateLabel.text = losses.human.date
        dateLabel.font = .systemFont(ofSize: 28, weight: .bold)
        
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    private func setupHumanView() {
        humanView.labeledTitle.text = "\(losses.human.personnel ?? 0) - Good russians"
        humanView.labeledImageView.image = UIImage(named: "man")
        
        view.addSubview(humanView)
        humanView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            humanView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            humanView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    private func setUpLeftStackView() {
        leftStackView.axis = .vertical
        leftStackView.spacing = 10
        view.addSubview(leftStackView)
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftStackView.topAnchor.constraint(equalTo: humanView.bottomAnchor, constant: 24),
            leftStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        
        let tankView = LabeledImageView()
        tankView.labeledImageView.image = UIImage(named: "tank")
        tankView.labeledTitle.text = "\(losses.techinque.tank)"
        leftStackView.addArrangedSubview(tankView)
        
        let planeView = LabeledImageView()
        planeView.labeledImageView.image = UIImage(named: "plane")
        planeView.labeledTitle.text = "\(losses.techinque.aircraft)"
        leftStackView.addArrangedSubview(planeView)
        
        let antiView = LabeledImageView()
        antiView.labeledImageView.image = UIImage(named: "anti")
        antiView.labeledTitle.text = "\(losses.techinque.antiAircraftWarfare)"
        leftStackView.addArrangedSubview(antiView)
        
        let droneView = LabeledImageView()
        droneView.labeledImageView.image = UIImage(named: "drone")
        droneView.labeledTitle.text = "\(losses.techinque.drone)"
        leftStackView.addArrangedSubview(droneView)
        
        let helicopterView = LabeledImageView()
        helicopterView.labeledImageView.image = UIImage(named: "helicopter")
        helicopterView.labeledTitle.text = "\(losses.techinque.helicopter)"
        leftStackView.addArrangedSubview(helicopterView)
    }
    
    private func setUpRightStackView() {
        rightStackView.axis = .vertical
        rightStackView.spacing = 10
        view.addSubview(rightStackView)
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rightStackView.topAnchor.constraint(equalTo: humanView.bottomAnchor, constant: 24),
            rightStackView.leadingAnchor.constraint(equalTo: humanView.trailingAnchor, constant: 16)
        ])
        
        let oilView = LabeledImageView()
        oilView.labeledImageView.image = UIImage(named: "oil")
        oilView.labeledTitle.text = "\(losses.techinque.fuelTank + losses.techinque.vehiclesAndFuelTanks)"
        rightStackView.addArrangedSubview(oilView)
        
        let boatView = LabeledImageView()
        boatView.labeledImageView.image = UIImage(named: "boat")
        boatView.labeledTitle.text = "\(losses.techinque.navalShip)"
        rightStackView.addArrangedSubview(boatView)
        
        let mrlView = LabeledImageView()
        mrlView.labeledImageView.image = UIImage(named: "armored-vehicle")
        mrlView.labeledTitle.text = "\(losses.techinque.MRL)"
        rightStackView.addArrangedSubview(mrlView)
        
        let artilleryView = LabeledImageView()
        artilleryView.labeledImageView.image = UIImage(named: "artillery")
        artilleryView.labeledTitle.text = "\(losses.techinque.fieldArtillery)"
        rightStackView.addArrangedSubview(artilleryView)
    }
}
