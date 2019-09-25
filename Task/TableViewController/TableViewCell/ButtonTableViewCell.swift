//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Michael Flowers on 9/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    var task: Task?
    
    @IBOutlet weak var primarylabel: UILabel!
    @IBOutlet weak var completeButtonProperties: UIButton!

    @IBAction func buttonTapped(_ sender: UIButton) {
        
    }
    
    func updateButton(_ isComplete: Bool){
        guard let passedInTask = task else { return }
        let imageName = passedInTask.isComplete ? "doneCheckMark" : "incompleteCheckMark"
        completeButtonProperties.setImage(UIImage(named: imageName), for: .normal)
    }
}

extension ButtonTableViewCell {
    func update(withTask task: Task){
       primarylabel.text = task.name
        self.updateButton(task.isComplete)

    }
}
