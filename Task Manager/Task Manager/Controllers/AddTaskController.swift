//
//  AddTaskController.swift
//  Task Manager
//
//  Created by Hamza on 05/04/2023.
//

import UIKit

class AddTaskController: UIViewController {
    
    @IBOutlet weak var titleTFView: TodoTFView!
    @IBOutlet weak var taskTFView: TodoTFView!
    
    var taskVM = TaskViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

// MARK: - Actions

extension AddTaskController {
    
    @IBAction func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        taskVM.saveTaskToCoreData(title: titleTFView.todoTF.text.stringValue, task: taskTFView.todoTF.text.stringValue) { errorMsg in
            if let msg = errorMsg {
                self.presentAlert(title: "Error", message: msg)
                return
            }
            self.backBtnTapped()
        }
    }
}
