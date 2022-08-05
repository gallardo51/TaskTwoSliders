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

    
    @IBOutlet weak var redViewLabel: UILabel!
    @IBOutlet weak var redCountLabel: UILabel!
    
    
    @IBOutlet weak var greenViewLabel: UILabel!
    @IBOutlet weak var greenCountLabel: UILabel!
    
    @IBOutlet weak var blueViewLabel: UILabel!
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
        
        setValue(for: redCountLabel, greenCountLabel, blueCountLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
    
    }

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
        
        setColor()
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        delegate?.setColor(mainViewLabel.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

 //MARK: - IB ACTIONS


//MARK: - Private Methods
extension ColorViewController {

private func setColor() {
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
            case redViewLabel: label.text = string(from: redSlider)
            case greenViewLabel: label.text = string(from: greenSlider)
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
    
    
    // Значения RGB
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
// MARK: - UITextFieldDelegate
extension ColorViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTextField:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: redViewLabel)
            case greenTextField:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: greenViewLabel)
            default:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: blueViewLabel)
            }
            
            setColor()
            return
        }
        
        showAlert(title: "Wrong format!", message: "Please enter correct value")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}

