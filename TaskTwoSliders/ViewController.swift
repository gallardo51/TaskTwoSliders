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
        redSliderLabel.value = 1
        redSliderLabel.minimumValue = 0
        redSliderLabel.maximumValue = 1
        redCountLabel.text = String(redSliderLabel.value)
        
        // Green
        greenSliderLabel.value = 1
        greenSliderLabel.minimumValue = 0
        greenSliderLabel.maximumValue = 1
        greenCountLabel.text = String(greenSliderLabel.value)
        
        
        // Blue
        blueSliderLabel.value = 1
        blueSliderLabel.minimumValue = 0
        blueSliderLabel.maximumValue = 1
        blueCountLabel.text = String(blueSliderLabel.value)
        
    }

    @IBAction func redSliderAction() {
    }
    @IBAction func greenSliderAction() {
    }
    @IBAction func blueSliderAction() {
    }
    
}

