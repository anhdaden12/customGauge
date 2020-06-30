//
//  CustomGaugeView.swift
//  CustomGauseControl
//
//  Created by Ngocnb on 6/29/20.
//  Copyright © 2020 NBN. All rights reserved.
//

import UIKit
import MBCircularProgressBar

@IBDesignable
final class CustomGaugeView: UIView {
    
    @IBOutlet var contentProgressbarView: MBCircularProgressBarView!
    
    var widthGauge: CGFloat {
           let value: CGFloat = contentProgressbarView.frame.size.width * 0.82
           return value
       }
    
    var heightGauge: CGFloat {
        let value: CGFloat = contentProgressbarView.frame.size.width * 0.82
        return value
    }
    
    var gaugeView = GaugeView(bigview: UIView())
    
    @IBInspectable
    var value: CGFloat {
        set {
            contentProgressbarView.value = newValue
        }
        get {
            return contentProgressbarView.value
        }
    }
    
    @IBInspectable
    var maxValue: CGFloat {
        set {
            contentProgressbarView.maxValue = newValue
        }
        get {
            return contentProgressbarView.maxValue
        }
    }
    
    @IBInspectable
    var valueFontSize: CGFloat {
        set {
            contentProgressbarView.valueFontSize = newValue
        }
        get {
            return contentProgressbarView.valueFontSize
        }
    }
    
    @IBInspectable
    var unitString: String {
        set {
            contentProgressbarView.unitString = newValue
        }
        get {
            return contentProgressbarView.unitString
        }
    }
    
    @IBInspectable
    var unitFontSize: CGFloat {
        set {
            contentProgressbarView.unitFontSize = newValue
        }
        get {
            return contentProgressbarView.unitFontSize
        }
    }
    
    @IBInspectable
    var progressLineWidth: CGFloat {
        set {
            contentProgressbarView.progressLineWidth = newValue
        }
        get {
            return contentProgressbarView.progressLineWidth
        }
    }
    
    @IBInspectable
    var progressColor: UIColor {
        set {
            contentProgressbarView.progressColor = newValue
        }
        get {
            return contentProgressbarView.progressColor
        }
    }
    
    @IBInspectable
    var progressStrokeColor: UIColor {
        set {
            contentProgressbarView.progressStrokeColor = newValue
        }
        get {
            return contentProgressbarView.progressStrokeColor
        }
    }
    
    @IBInspectable
    var emptyLineWidth: CGFloat {
        set {
            contentProgressbarView.emptyLineWidth = newValue
        }
        get {
            return contentProgressbarView.emptyLineWidth
        }
    }
    
    @IBInspectable
    var progressAngle: CGFloat {
        set {
            contentProgressbarView.progressAngle = newValue
        }
        get {
            return contentProgressbarView.progressAngle
        }
    }
    
    @IBInspectable
    var emptyLineColor: UIColor {
        set {
            contentProgressbarView.emptyLineColor = newValue
        }
        get {
            return contentProgressbarView.emptyLineColor
        }
    }
    
    @IBInspectable
    var emptyLineStrokeColor: UIColor {
        set {
            contentProgressbarView.emptyLineStrokeColor = newValue
        }
        get {
            return contentProgressbarView.emptyLineStrokeColor
        }
    }
    
    @IBInspectable
    var emptyCapType: Int {
        set {
            contentProgressbarView.emptyCapType = newValue
        }
        get {
            return contentProgressbarView.emptyCapType
        }
    }
    
    @IBInspectable
    var progressCapType: Int {
        set {
            contentProgressbarView.progressCapType = newValue
        }
        get {
            return contentProgressbarView.progressCapType
        }
    }
    
    @IBInspectable
    var fontColor: UIColor {
        set {
            contentProgressbarView.fontColor = newValue
        }
        get {
            return contentProgressbarView.fontColor
        }
    }
    
    @IBInspectable
    var progressRotationAngle: CGFloat {
        set {
            contentProgressbarView.progressRotationAngle = newValue
        }
        get {
            return contentProgressbarView.progressRotationAngle
        }
    }
    
    @IBInspectable
    var decimalPlaces: Int {
        set {
            contentProgressbarView.decimalPlaces = newValue
        }
        get {
            return contentProgressbarView.decimalPlaces
        }
    }
    
    @IBInspectable
    var valueDecimalFontSize: CGFloat {
        set {
            contentProgressbarView.valueDecimalFontSize = newValue
        }
        get {
            return contentProgressbarView.valueDecimalFontSize
        }
    }
    
    @IBInspectable
    var unitFontName: String {
        set {
            contentProgressbarView.unitFontName = newValue
        }
        get {
            return contentProgressbarView.unitFontName
        }
    }
    
    @IBInspectable
    var valueFontName: String {
        set {
            contentProgressbarView.valueFontName = newValue
        }
        get {
            return contentProgressbarView.valueFontName
        }
    }
    
    @IBInspectable
    var showUnitString: Bool {
        set {
            contentProgressbarView.showUnitString = newValue
        }
        get {
            return contentProgressbarView.showUnitString
        }
    }
    
    @IBInspectable
    var showValueString: Bool {
        set {
            contentProgressbarView.showValueString = newValue
        }
        get {
            return contentProgressbarView.showValueString
        }
    }
    
    @IBInspectable
    var textOffset: CGPoint {
        set {
            contentProgressbarView.textOffset = newValue
        }
        get {
            return contentProgressbarView.textOffset
        }
    }
    
    @IBInspectable
    var countdown: Bool {
        set {
            contentProgressbarView.countdown = newValue
        }
        get {
            return contentProgressbarView.countdown
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setDefaultProgressbarView()
        setDefaultGaugeView()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setDefaultProgressbarView()
        setDefaultGaugeView()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: CustomGaugeView.self)
        bundle.loadNibNamed("CustomGaugeView", owner: self, options: nil)
        addSubview(contentProgressbarView)
        contentProgressbarView.frame = self.bounds
        contentProgressbarView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func setDefaultGaugeView() {
        gaugeView = GaugeView(bigview: contentProgressbarView)
        gaugeView.value = 0
        gaugeView.backgroundColor = .clear
        checkProgressColor(withNumber: gaugeView.value)
        contentProgressbarView.value = CGFloat(gaugeView.value)
        contentProgressbarView.addSubview(gaugeView)
        gaugeView.translatesAutoresizingMaskIntoConstraints = false
        gaugeView.heightAnchor.constraint(equalToConstant: widthGauge).isActive = true
        gaugeView.widthAnchor.constraint(equalToConstant: widthGauge).isActive = true
        gaugeView.centerXAnchor.constraint(equalTo: contentProgressbarView.centerXAnchor).isActive = true
        gaugeView.centerYAnchor.constraint(equalTo: contentProgressbarView.centerYAnchor).isActive = true
    }
    
    func setDefaultProgressbarView() {
        contentProgressbarView.value = 30
        contentProgressbarView.showValueString = true
        contentProgressbarView.showUnitString = true
        contentProgressbarView.maxValue = 100
        contentProgressbarView.decimalPlaces = 0
        contentProgressbarView.progressColor = UIColor.init(hexString: "00B1FF")
        contentProgressbarView.progressStrokeColor = UIColor.init(hexString: "00B1FF")
        contentProgressbarView.emptyLineWidth = 25
        contentProgressbarView.progressLineWidth = 23
        contentProgressbarView.emptyCapType = 1
        contentProgressbarView.unitFontSize = 60
        contentProgressbarView.textOffset = CGPoint(x: 8, y: 100)
        contentProgressbarView.unitString = " "
        contentProgressbarView.progressCapType = 1
    }
    
    func checkProgressColor(withNumber number: Int) {
        if number <= 24 {
            self.contentProgressbarView.progressColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            self.contentProgressbarView.progressStrokeColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        } else if number > 24 && number <= 65 {
            self.contentProgressbarView.progressColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            self.contentProgressbarView.progressStrokeColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        } else if number > 65 && number <= 100 {
            self.contentProgressbarView.progressColor = #colorLiteral(red: 0, green: 0.697074352, blue: 1, alpha: 1)
            self.contentProgressbarView.progressStrokeColor = #colorLiteral(red: 0, green: 0.697074352, blue: 1, alpha: 1)
        }
    }
    
    func setProgress(fromValue value: Int, toNumber number: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                if number < 0 || number > 100 { return }
                let centerValue = number < value ? CGFloat(abs(value / 2)) : CGFloat(abs(number / 2))
                self.contentProgressbarView.value = CGFloat(number)
                
                if centerValue > 30 {
                    self.gaugeView.value = Int(centerValue)
                    self.gaugeView.value = number
                    self.checkProgressColor(withNumber: number)
                } else {
                    self.gaugeView.value = number
                    self.checkProgressColor(withNumber: number)
                }
            }
        }
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

