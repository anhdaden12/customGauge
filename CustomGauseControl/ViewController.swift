//
//  ViewController.swift
//  CustomGauseControl
//
//  Created by viettel on 6/24/20.
//  Copyright © 2020 NBN. All rights reserved.
//

import UIKit
//import GaugeMeterView
//import GDGauge
//import LMGaugeViewSwift
import MBCircularProgressBar

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBarView: MBCircularProgressBarView!
    @IBOutlet weak var valueTextfield: UITextField!
    
    
    let test = GaugeView(frame: CGRect(x: 0, y: 0, width: 256, height: 256))
    override func viewDidLoad() {
        super.viewDidLoad()
        addgaugeView()
    }
    
    
    func addgaugeView() {
        test.value = 0
        test.backgroundColor = .clear
        checkProgressColor(withNumber: test.value)
        progressBarView.value = CGFloat(test.value)
        progressBarView.addSubview(test)
        test.translatesAutoresizingMaskIntoConstraints = false
        test.heightAnchor.constraint(equalToConstant: 256).isActive = true
        test.widthAnchor.constraint(equalToConstant: 256).isActive = true
        test.centerXAnchor.constraint(equalTo: progressBarView.centerXAnchor).isActive = true
        test.centerYAnchor.constraint(equalTo: progressBarView.centerYAnchor).isActive = true
    }
    
    func checkProgressColor(withNumber number: Int) {
        if number <= 24 {
            self.progressBarView.progressColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            self.progressBarView.progressStrokeColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        } else if number > 24 && number <= 65 {
            self.progressBarView.progressColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            self.progressBarView.progressStrokeColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        } else if number > 65 && number <= 100 {
            self.progressBarView.progressColor = #colorLiteral(red: 0, green: 0.697074352, blue: 1, alpha: 1)
            self.progressBarView.progressStrokeColor = #colorLiteral(red: 0, green: 0.697074352, blue: 1, alpha: 1)
        }
    }
    
    func setProgress(fromValue value: Int, toNumber number: Int) {
        if number < 0 || number > 100 { return }
        let centerValue = number < value ? CGFloat(abs(value / 2)) : CGFloat(abs(number / 2))
        self.progressBarView.value = CGFloat(number)
        if centerValue > 30 {
            self.test.value = Int(centerValue)
            self.test.value = number
            self.checkProgressColor(withNumber: number)
        } else {
            self.test.value = number
            self.checkProgressColor(withNumber: number)
        }
    }
    
    @IBAction func onClickchangevalue(_ sender: Any) {
        guard let value: Int = Int(valueTextfield.text ?? "0") else {
            print("cannot parse number")
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                self.setProgress(fromValue: self.test.value, toNumber: value)
            }
        }
        
    }
    
    
}

