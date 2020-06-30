//
//  DemoView.swift
//  CustomGauseControl
//
//  Created by Ngocnb on 6/30/20.
//  Copyright © 2020 NBN. All rights reserved.
//

import UIKit

final class NeedleView: UIView {
    
    var path : UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func draw(_ rect: CGRect) {
        createClockNeedle()
    }
    
    private func createClockNeedle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.midX , y: 0.0))
        path.addLine(to: CGPoint(x: bounds.midX + 3 , y: self.frame.size.height))
        path.addLine(to: CGPoint(x: bounds.midX - 3, y: self.frame.size.height))
        path.close()
        UIColor.black.setFill()
        path.fill()
        UIColor.black.setStroke()
        path.stroke()
    }
    
}
