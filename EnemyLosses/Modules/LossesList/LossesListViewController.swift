//
//  ViewController.swift
//  EnemyLosses
//
//  Created by Polina Martynenko on 04.07.2022.
//

import UIKit

class LossesListViewController: UIViewController {
    
    let viewModel: LossesListViewModel
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: LossesListViewController.createCompositionalLayout())
    
    init(viewModel: LossesListViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        viewModel.onViewDidLoad()
        setUpCollectionView()
    }
    
    
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.register(EnemyLossesCollectionViewCell.self, forCellWithReuseIdentifier: "cell" )
        collectionView.register(HeaderEnemyLosses.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderEnemyLosses.indentifier)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 15
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
        
    }
    
    static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                                                    .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 10, leading: 15, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        
        // section.orthogonalScrollingBehavior = .groupPaging
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(100.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.boundarySupplementaryItems = [header]
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension LossesListViewController: LossesListViewModelDelegate {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
    
}

extension LossesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.losses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? EnemyLossesCollectionViewCell {
            cell.listLabel.text = viewModel.losses[indexPath.row].0.date
            
            let currentHuman = viewModel.losses[indexPath.row].0.personnel ?? 0
            if indexPath.row + 1 < viewModel.losses.count {
                let previousHuman = viewModel.losses[indexPath.row + 1].0.personnel ?? 0
                cell.humanView.labeledTitle.text = "+ \(currentHuman - previousHuman)"
            } else {
                cell.humanView.labeledTitle.text = "+ \(currentHuman)"
            }
            
            let currentTechnique = viewModel.losses[indexPath.row].1.total
            if indexPath.row + 1 < viewModel.losses.count {
                let previousTechnique = viewModel.losses[indexPath.row + 1].1.total
                cell.techniqueView.labeledTitle.text = "+ \(currentTechnique - previousTechnique)"
            } else {
                cell.techniqueView.labeledTitle.text = "+ \(currentTechnique)"
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderEnemyLosses.indentifier, for: indexPath) as! HeaderEnemyLosses
        
        header.humanView.labeledTitle.text = "\(viewModel.losses.first?.0.personnel ?? 0)"
        header.techniqueView.labeledTitle.text = "\(viewModel.losses.first?.1.total ?? 0)"
        
        
        return header
    }
}

