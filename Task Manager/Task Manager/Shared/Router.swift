//
//  Router.swift
//  Task Manager
//
//  Created by Hamza on 05/04/2023.
//

import Foundation
import UIKit

struct Router {
    
    static func addTaskVC() -> AddTaskController {
        UIStoryboard(storyboard: .main).instantiateViewController(withClass: AddTaskController.self)!
    }
    
}
