//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Michael Flowers on 9/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    var task: Task? {
        didSet {
            print("Task in the detail set")
            updateViews()
        }
    }
    var dueDate: Date?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        dueDateTextField.inputView = dueDatePicker
    }

    // MARK: - Table view data source
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateTextField.text = dueDatePicker.date.stringValue()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text, !name.isEmpty, let due = dueDateTextField.text, !due.isEmpty, let notes = notesTextView.text, !notes.isEmpty else  { return }
        if let passedInTask = task  {
            //update
            TaskController.shared.update(task: passedInTask, name: name, notes: notes, due: due.dateValue())
        } else {
            //add task
            TaskController.shared.add(taskWithName: name, notes: notes, due: due.dateValue())
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func updateViews(){
    guard let passedInTask = task, isViewLoaded else {
        self.title = "Please Enter Task Details"
        return }
        self.title =  passedInTask.name
        nameTextField.text = passedInTask.name
        dueDateTextField.text = passedInTask.due?.stringValue()
        notesTextView.text = passedInTask.notes
    
    }
    
    
    
}
