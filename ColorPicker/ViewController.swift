//
//  ViewController.swift
//  ColorPicker
//
//  Created by Roman Golubinko on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        colorView.layer.cornerRadius = 16
       
        colorView.backgroundColor = view.backgroundColor
        setSlidersColor()
        setLabelsInitialValues()
    }
    
    // MARK: IBActions
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValue.text = String(round(redSlider.value * 100) / 100)
        case greenSlider:
            greenValue.text = String(round(greenSlider.value * 100) / 100)
        default:
            blueValue.text = String(round(blueSlider.value * 100) / 100)
        }
        setViewColor()
    }
    
//    @IBAction func showRedColorValue() {
//        redValue.text = String(round(redSlider.value * 100) / 100)
//        setViewColor()
//    }
//    
//    @IBAction func showGreedColorValue() {
//        greenValue.text = String(round(greenSlider.value * 100) / 100)
//        setViewColor()
//    }
//    
//    @IBAction func showBlueColorValue() {
//        blueValue.text = String(round(blueSlider.value * 100) / 100)
//        setViewColor()
//    }
    
    // MARK: Private Funtions
    
    private func setSlidersColor() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func setLabelsInitialValues() {
        redValue.text = "0.0"
        greenValue.text = "0.0"
        blueValue.text = "0.0"
    }
    
    private func setViewColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
