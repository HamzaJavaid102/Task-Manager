//
//  TaskViewModel.swift
//  Task Manager
//
//  Created by Hamza on 06/04/2023.
//

import Foundation
import UIKit
import CoreData

class TaskViewModel {
    
    var tasks: [Task] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchTasks(completion: @escaping(String?) -> Void) {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            tasks = try context.fetch(request)
            completion(nil)
        } catch {
            print("Error fetching tasks: \(error)")
            completion(error.localizedDescription)
        }
    }
    
    func saveTaskToCoreData(title: String, task: String, completion: @escaping(String?) -> Void) {
        
        let entity = NSEntityDescription.entity(forEntityName: Entities.task.rawValue.capitalized, in: context)
        let newTask = NSManagedObject(entity: entity!, insertInto: context)
        newTask.setValue(title, forKey: Entities.Attributes.title.rawValue)
        newTask.setValue(task, forKey: Entities.Attributes.task.rawValue)
        newTask.setValue(false, forKey: Entities.Attributes.isSelected.rawValue)
        newTask.setValue(Date(), forKey: Entities.Attributes.date.rawValue)
        newTask.setValue(UUID().uuidString, forKey: Entities.Attributes.id.rawValue)
        do {
            try context.save()
            completion(nil)
        } catch(let e) {
            print(e)
            completion(e.localizedDescription)
        }
    }
    
    func updateTask(task: Task, completion: @escaping(String?) -> Void) {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", task.id ?? "")
        do {
            let taskTobeUpdate = try context.fetch(request)
            taskTobeUpdate.first?.setValue(task.title, forKey: Entities.Attributes.title.rawValue)
            taskTobeUpdate.first?.setValue(task.task, forKey: Entities.Attributes.task.rawValue)
            taskTobeUpdate.first?.setValue(task.isSelected ? 0 : 1, forKey: Entities.Attributes.isSelected.rawValue)
            taskTobeUpdate.first?.setValue(task.date, forKey: Entities.Attributes.date.rawValue)
            taskTobeUpdate.first?.setValue(task.id, forKey: Entities.Attributes.id.rawValue)
            try context.save()
            self.fetchTasks { errorMsg in
                completion(nil)
            }
        } catch(let e) {
            print("Error updating tasks: \(e)")
            completion(e.localizedDescription)
        }
    }
    
    func deleteTask(task: Task, completion: @escaping(String?) -> Void) {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", task.id ?? "")
        do {
            let taskTobeDelete = try context.fetch(request)
            guard let taskTobeDelete = taskTobeDelete.first else {
                completion("Not Fount")
                return;
            }
            context.delete(taskTobeDelete)
            try context.save()
            self.fetchTasks { errorMsg in
                completion(nil)
            }
        } catch(let e) {
            print("Error updating tasks: \(e)")
            completion(e.localizedDescription)
        }
    }
}
