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
        view.backgroundColor = .blue
        
        viewModel.onViewDidLoad()
        setUpCollectionView()
    }
    

    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.register(EnemyLossesCollectionViewCell.self, forCellWithReuseIdentifier: "cell" )
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
        group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        
       // section.orthogonalScrollingBehavior = .groupPaging
        
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
            cell.humanView.labeledTitle.text = "\(viewModel.losses[indexPath.row].0.personnel ?? 0)"
            cell.techniqueView.labeledTitle.text = "\(viewModel.losses[indexPath.row].1.total)"

            return cell
        }
        return UICollectionViewCell()
    }
}

