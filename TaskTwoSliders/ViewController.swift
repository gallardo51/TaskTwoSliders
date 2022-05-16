//
//  ViewController.swift
//  TaskTwoSliders
//
//  Created by Александр Соболев on 06.05.2022.
//

import UIKit

class ViewController: UIViewController {

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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View Label
        mainViewLabel.layer.cornerRadius = 10
        
        // Red
        redSliderLabel.value = 0.15
        redSliderLabel.minimumValue = 0
        redSliderLabel.maximumValue = 1
        redCountLabel.text = String(redSliderLabel.value)
        
        
        
        // Green
        greenSliderLabel.value = 0.35
        greenSliderLabel.minimumValue = 0
        greenSliderLabel.maximumValue = 1
        greenCountLabel.text = String(greenSliderLabel.value)
        
        
        // Blue
        blueSliderLabel.value = 0.55
        blueSliderLabel.minimumValue = 0
        blueSliderLabel.maximumValue = 0
        
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
    
    
}

