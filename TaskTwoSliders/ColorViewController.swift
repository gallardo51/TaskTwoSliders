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
        
        mainViewLabel.backgroundColor = viewColor
        
        // Red
        redSlider.value = 0.15
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redCountLabel.text = String(redSlider.value)
        redSlider.tintColor = .red
        
        
        
        // Green
        greenSlider.value = 0.35
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenCountLabel.text = String(greenSlider.value)
        greenSlider.tintColor = .green
        
        
        // Blue
        blueSlider.value = 0.55
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueCountLabel.text = String(blueSlider.value)
    
    }

    @IBAction func changeSliderAction() {
        redCountLabel.text = String(format: "%.2f", redSlider.value)
        let redSliderValue = CGFloat(redSlider.value)
        
        greenCountLabel.text = String(format: "%.2f", greenSlider.value)
        let greenSliderValue = CGFloat(greenSlider.value)
        
        blueCountLabel.text = String(format: "%.2f", blueSlider.value)
        let blueSliderValue = CGFloat(blueSlider.value)
        
        
        mainViewLabel.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: 1)
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        delegate.setColor(mainViewLabel.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

