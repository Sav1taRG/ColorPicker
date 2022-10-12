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
    
    @IBOutlet var redLB: UILabel!
    @IBOutlet var greenLB: UILabel!
    @IBOutlet var blueLB: UILabel!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var colorStartVC: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleColorView.backgroundColor = colorStartVC
        sampleColorView.layer.cornerRadius = 16
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        setSlidersStyle()
        setSliders()
        setLbValue(redLB, greenLB, blueLB)
        setTfValue(redTF, greenTF, blueTF)
    }
    
    // MARK: IBActions
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setTfValue(redTF)
            setLbValue(redLB)
        case greenSlider:
            setTfValue(greenTF)
            setLbValue(greenLB)
        default:
            setTfValue(blueTF)
            setLbValue(blueLB)
        }
        setViewColor()
    }
    
    
    // MARK: Private Methods
    
    private func valueTextFormat(from slider: UISlider ) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setSlidersStyle() {
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
        guard let newValue = textField.text else { return }
        guard let currentValue = Float(newValue) else { return }
        switch textField {
        case redTF:
            redSlider.setValue(currentValue, animated: true)
            setLbValue(redLB)
        case greenTF:
            greenSlider.setValue(currentValue, animated: true)
            setLbValue(greenLB)
        default:
            blueSlider.setValue(currentValue, animated: true)
            setLbValue(blueLB)
        }
        setViewColor()
    }
    
    func setSliders() {
        let ciColor = CIColor(color: colorStartVC)
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    func setTfValue(_ textFields: UITextField...) {
        for textField in textFields {
            switch textField {
            case redTF:
                redTF.text = valueTextFormat(from: redSlider)
            case greenTF:
                greenTF.text = valueTextFormat(from: greenSlider)
            default:
                blueTF.text = valueTextFormat(from: blueSlider)
            }
        }
    }
    
    func setLbValue(_ labels: UILabel...) {
        for label in labels {
            switch label {
            case redLB:
                redLB.text = valueTextFormat(from: redSlider)
            case greenLB:
                greenLB.text = valueTextFormat(from: greenSlider)
            default:
                blueLB.text = valueTextFormat(from: blueSlider)
            }
        }
    }
}
