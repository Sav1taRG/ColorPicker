//
//  ViewController.swift
//  ColorPicker
//
//  Created by Roman Golubinko on 25.09.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var sampleColorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var valueColorVC: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleColorView.layer.cornerRadius = 16
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
    
    
    // MARK: Private Functions
    
    private func valueTextFormat(from slider: UISlider ) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setSlidersColor() {
        redSlider.minimumTrackTintColor = .systemRed
        greenSlider.minimumTrackTintColor = .systemGreen
        blueSlider.minimumTrackTintColor = .systemBlue
    }
    
    private func setViewColor() {
        sampleColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
