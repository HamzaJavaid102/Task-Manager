//
//  TodoCVCell.swift
//  Task Manager
//
//  Created by Hamza on 04/04/2023.
//

import UIKit

class TodoCVCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var taskLbl: UILabel!
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var delegate: TodoCellDelegate?
    var index: IndexPath!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var task: Task? {
        didSet {
            titleLbl.text = task?.title.stringValue
            taskLbl.text = task?.task.stringValue
            selectBtn.setImage((task?.isSelected ?? false) ? "check-square".toImage : "square".toSystemImage , for: .normal)
        }
    }
    
    @IBAction func deleteBtnTapped(_ sender: UIButton) {
        guard let task = task else { return; }
        delegate?.deletetask(task: task)
    }
    
    @IBAction func selectBtnTapped(_ sender: UIButton) {
        guard let task = task else { return; }
        delegate?.updatetask(task: task)
    }
}
