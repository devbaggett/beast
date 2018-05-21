//
//  BeastedVC.swift
//  BeastExam
//
//  Created by Devin Baggett on 5/18/18.
//  Copyright © 2018 devbaggett. All rights reserved.
//

import UIKit

class BeastedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func toBeastPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
