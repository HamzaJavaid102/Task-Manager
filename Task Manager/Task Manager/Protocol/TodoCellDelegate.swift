//
//  TodoCellDelegate.swift
//  Task Manager
//
//  Created by Hamza on 06/04/2023.
//

import Foundation

protocol TodoCellDelegate {
    func deletetask(task: Task)
    func updatetask(task: Task)
}

protocol TodoCollectionViewDelegate {
    func showErrorMsg(errorMsg: String)
    func showAlertForDelete(task: Task)
}
