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
    
    @IBOutlet weak var redSliderLabel: UISlider!
    @IBOutlet weak var greenSliderLabel: UISlider!
    @IBOutlet weak var blueSliderLabel: UISlider!
    
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
        
        mainViewLabel.backgroundColor = viewColor
        
        // Red
        redSliderLabel.value = 0.15
        redSliderLabel.minimumValue = 0
        redSliderLabel.maximumValue = 1
        redCountLabel.text = String(redSliderLabel.value)
        redSliderLabel.tintColor = .red
        
        
        
        // Green
        greenSliderLabel.value = 0.35
        greenSliderLabel.minimumValue = 0
        greenSliderLabel.maximumValue = 1
        greenCountLabel.text = String(greenSliderLabel.value)
        greenSliderLabel.tintColor = .green
        
        
        // Blue
        blueSliderLabel.value = 0.55
        blueSliderLabel.minimumValue = 0
        blueSliderLabel.maximumValue = 1
        blueCountLabel.text = String(blueSliderLabel.value)
    
    }

    @IBAction func changeSliderAction() {
        redCountLabel.text = String(format: "%.2f", redSliderLabel.value)
        let redSliderValue = CGFloat(redSliderLabel.value)
        
        greenCountLabel.text = String(format: "%.2f", greenSliderLabel.value)
        let greenSliderValue = CGFloat(greenSliderLabel.value)
        
        blueCountLabel.text = String(format: "%.2f", blueSliderLabel.value)
        let blueSliderValue = CGFloat(blueSliderLabel.value)
        
        
        mainViewLabel.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: 1)
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: viewColor)
        
        redSliderLabel.value = Float(ciColor.red)
        greenSliderLabel.value = Float(ciColor.green)
        blueSliderLabel.value = Float(ciColor.blue)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        delegate.setColor(mainViewLabel.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

