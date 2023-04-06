//
//  TodoTFView.swift
//  Task Manager
//
//  Created by Hamza on 05/04/2023.
//

import UIKit

@IBDesignable
class TodoTFView: UIView {
    
    @IBOutlet weak var titleLbl:  UILabel!
    @IBOutlet weak var todoTF: UITextField!
    
    @IBInspectable
    var title: String = "" {
        didSet {
            titleLbl.text = title
        }
    }
    
    @IBInspectable
    var placeHolder: String = "" {
        didSet {
            todoTF.placeholder = placeHolder
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
}
