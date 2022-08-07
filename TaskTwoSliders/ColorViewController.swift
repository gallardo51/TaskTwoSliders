//
//  ViewController.swift
//  TaskTwoSliders
//
//  Created by Александр Соболев on 06.05.2022.
//

import UIKit

class ColorViewController: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var mainViewLabel: UIView!

    @IBOutlet weak var redCountLabel: UILabel!
    @IBOutlet weak var greenCountLabel: UILabel!
    @IBOutlet weak var blueCountLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    //MARK: - Public Properties
    var delegate: ColorViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View Label
        mainViewLabel.layer.cornerRadius = 10
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        mainViewLabel.backgroundColor = viewColor
        
        setSliders()
        setValue(for: redCountLabel, greenCountLabel, blueCountLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
    }
    
    // MARK: - IB Actions
    @IBAction func changeSliderAction(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            setValue(for: redCountLabel)
            setValue(for: redTextField)
        case greenSlider:
            setValue(for: greenCountLabel)
            setValue(for: greenTextField)
        default:
            setValue(for: blueCountLabel)
            setValue(for: blueTextField)
        }
        
        setNewColor()
    }
     
    @IBAction func doneButtonPressed() {
        delegate?.setNewColor(mainViewLabel.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension ColorViewController {
    private func setNewColor() {
        mainViewLabel.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redCountLabel: label.text = string(from: redSlider)
            case greenCountLabel: label.text = string(from: greenSlider)
            default: label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField: textField.text = string(from: redSlider)
            case greenTextField: textField.text = string(from: greenSlider)
            default: textField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
