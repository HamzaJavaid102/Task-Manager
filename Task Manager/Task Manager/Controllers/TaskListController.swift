//
//  TaskListController.swift
//  Task Manager
//
//  Created by Hamza on 05/04/2023.
//

import UIKit

class TaskListController: UIViewController {
    
    @IBOutlet weak var todoCollectionView: TodoCollectionView!
    
    var taskVM = TaskViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchTaskList()
    }
    
    private func initUI() {
        todoCollectionView.taskVM = taskVM
        todoCollectionView.delegate = self
    }
    
    private func fetchTaskList() {
        taskVM.fetchTasks { errorMsg in
            if let msg = errorMsg {
                self.presentAlert(title: "Error", message: msg)
            }
            self.todoCollectionView.collectionView.reloadData()
        }
    }
}

// MARK: - Actions

extension TaskListController {
    
    @IBAction func plusBtnTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(Router.addTaskVC(), animated: true)
    }
}

extension TaskListController: TodoCollectionViewDelegate {
    
    func showAlertForDelete(task: Task) {
        presentAlertWithAction(title: "Delete", message: "Are you sure you want to delete", positive: "Delete", negative: "Cancel") {
            self.taskVM.deleteTask(task: task) { errorMsg in
                if let msg = errorMsg {
                    self.presentAlert(title: "Error", message: msg)
                    return
                }
                self.todoCollectionView.collectionView.reloadData()
            }
        }
    }
    
    func showErrorMsg(errorMsg: String) {
        self.presentAlert(title: "Error", message: errorMsg)
    }
}
