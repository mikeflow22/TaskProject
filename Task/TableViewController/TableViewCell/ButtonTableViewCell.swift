//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Michael Flowers on 9/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate: class {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}
class ButtonTableViewCell: UITableViewCell {

    var task: Task?
    weak var delegate: ButtonTableViewCellDelegate?
    
    @IBOutlet weak var primarylabel: UILabel!
    @IBOutlet weak var completeButtonProperties: UIButton!

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("button clicked")
        delegate?.buttonCellButtonTapped(self)
    }
    
    func updateButton(_ isComplete: Bool){
        let imageName = isComplete ? "doneCheckMark" : "incompleteCheckmark"
        completeButtonProperties.setImage(UIImage(named: imageName), for: .normal)
        print("update button should change")
        print("\(imageName)")
    }
}

extension ButtonTableViewCell {
    func update(withTask task: Task){
       primarylabel.text = task.name
        self.updateButton(task.isComplete)
        print("update with task was hit")

    }
}
