//
//  ViewController2.swift
//  CustomGauseControl
//
//  Created by viettel on 6/30/20.
//  Copyright © 2020 NBN. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var progressbarview: CustomGaugeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onclickchange(sender: Any) {
         self.progressbarview.setProgress(fromValue: 0, toNumber: 100)
    }
}
