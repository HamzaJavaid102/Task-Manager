//
//  TodoCollectionView.swift
//  Task Manager
//
//  Created by Hamza on 04/04/2023.
//

import UIKit

class TodoCollectionView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var taskVM: TaskViewModel!
    var delegate: TodoCollectionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }
}

extension TodoCollectionView {
    
    private func initUI() {
        configureView()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCells(cells: [TodoCVCell.self])
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(section: postCategoryCompositionalLayout())
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 15
        config.scrollDirection = .vertical
        layout.configuration = config
        return layout
    }
    
    private func postCategoryCompositionalLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.edgeSpacing = .init(leading: .fixed(0), top: .fixed(12), trailing: .fixed(0), bottom: .fixed(0))
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}

extension TodoCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        taskVM.tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TodoCVCell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as TodoCVCell
        cell.task = taskVM.tasks[indexPath.item]
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension TodoCollectionView: TodoCellDelegate {
    
    func deletetask(task: Task) {
        delegate?.showAlertForDelete(task: task)
    }
    
    func updatetask(task: Task) {
        taskVM.updateTask(task: task) { errorMsg in
            if let msg = errorMsg {
                self.delegate?.showErrorMsg(errorMsg: msg)
                return
            }
            self.collectionView.reloadData()
        }
    }
    
}

