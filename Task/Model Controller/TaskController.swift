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
    
//    var tasks: [Task] = []
    let fetchedResultsController: NSFetchedResultsController<Task>
    init(){
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "isComplete", ascending: false), NSSortDescriptor(key: "due", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.mainContext, sectionNameKeyPath: "isComplete", cacheName: nil)
        do {
            try frc.performFetch()
        } catch  {
            print("Error fetching  takss: \(error)")
        }
        fetchedResultsController  = frc
    }
    
    //MARK: - MOCK DATA
//    var mocTasks: [Task]{
//        let fourthTask = Task(name: "Fourth")
//        fourthTask.isComplete = true
//        fourthTask.due = Date()
//
//        let first = Task(name: "first")
//        let second = Task(name: "second", notes: "Second", due: Date(), isComplete: false)
//        second.due = Date()
//        let thrid = Task(name: "Third", notes: "third", due: nil, isComplete: true)
//        thrid.isComplete = true
//
//
//        return [first, second, thrid, fourthTask]
//    }
    
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
    
    func toggleIsCompleteFor(task: Task){
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
        
        do {
            try CoreDataStack.mainContext.save()
        } catch  {
            print("Error saving to main context: \(error)  \(#function)")
        }
    }
    
//    func fetchTasks() -> [Task]  {
//        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
//
//        do {
//          let returnedTasks = try CoreDataStack.mainContext.fetch(fetchRequest)
//            return returnedTasks
//        } catch  {
//            print("Error fetching Tasks: \(error) \(#function)")
//        }
//        return []
//        return mocTasks
//    }
}
