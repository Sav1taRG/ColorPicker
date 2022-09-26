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
       
        setViewColor()
        
        setSlidersColor()
    }
    
    // MARK: IBActions
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValue.text = valueTextFormat(from: redSlider)
        case greenSlider:
            greenValue.text = valueTextFormat(from: greenSlider)
        default:
            blueValue.text = valueTextFormat(from: blueSlider)
        }
        setViewColor()
    }
    
    
    // MARK: Private Funtions
    
    private func valueTextFormat(from slider: UISlider ) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setSlidersColor() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
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
