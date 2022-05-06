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
        
        mainViewLabel.layer.cornerRadius = 10
    }


}

