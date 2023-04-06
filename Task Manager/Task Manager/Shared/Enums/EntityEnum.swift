//
//  EntityEnum.swift
//  Task Manager
//
//  Created by Hamza on 06/04/2023.
//

import Foundation

enum Entities: String {
    
    case task
    
    enum Attributes: String {
        case id, task, title, date, isSelected
    }
}
