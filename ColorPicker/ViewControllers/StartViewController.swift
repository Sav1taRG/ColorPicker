//
//  ColorViewControllerViewController.swift
//  ColorPicker
//
//  Created by Roman on 12.10.2022.
//

import UIKit

// MARK: Delegate Protocol
protocol SettingsViewControllerDelegate {
    func setBackground(color: UIColor)
}

class StartViewController: UIViewController {
    
    // MARK: Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.colorStartVC = view.backgroundColor
    }
}

    extension StartViewController: SettingsViewControllerDelegate {
        func setBackground(color: UIColor) {
            view.backgroundColor = color
        }
    }
