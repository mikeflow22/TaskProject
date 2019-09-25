//
//  TaskController.swift
//  Task
//
//  Created by Michael Flowers on 9/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    static let shared = TaskController()
    
    var tasks: [Task] = []
    
    init(){
       tasks = fetchTasks()
    }
    
    //MARK: - MOCK DATA
    var mocTasks: [Task]{
        return [Task(name: "first"), Task(name: "second", notes: "Second", due: Date(), isComplete: false), Task(name: "Third", notes: "third", due: nil, isComplete: true)]
    }
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?){
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    
    func remove(task: Task){
        CoreDataStack.mainContext.delete(task)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
        
        do {
            try CoreDataStack.mainContext.save()
        } catch  {
            print("Error saving to main context: \(error)  \(#function)")
        }
    }
    
    func fetchTasks() -> [Task]  {
//        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
//
//        do {
//          let returnedTasks = try CoreDataStack.mainContext.fetch(fetchRequest)
//            return returnedTasks
//        } catch  {
//            print("Error fetching Tasks: \(error) \(#function)")
//        }
//        return []
        return mocTasks
    }
}
