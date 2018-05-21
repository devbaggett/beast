//
//  ItemVC.swift
//  BeastExam
//
//  Created by Devin Baggett on 5/18/18.
//  Copyright © 2018 devbaggett. All rights reserved.
//

import UIKit

protocol ItemVCDelegate {
    func donePressed(title: String, indexPath: IndexPath?)
}

class ItemVC: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    
    var delegate: ItemVCDelegate!
    var note: Note?
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let n = note {
            titleField.text = n.title
        }
       
    }

  
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        let title = titleField.text!
        delegate.donePressed(title: title, indexPath: indexPath)
    }
    
}
