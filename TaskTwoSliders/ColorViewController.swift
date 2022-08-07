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
        
        setSliders()
    }

    @IBAction func changeSliderAction(_ sender: UISlider) {
        redCountLabel.text = String(format: "%.2f", redSlider.value)
        greenCountLabel.text = String(format: "%.2f", greenSlider.value)
        blueCountLabel.text = String(format: "%.2f", blueSlider.value)
        
        setNewColor()
    }
     
    @IBAction func doneButtonPressed() {
        delegate?.setNewColor(mainViewLabel.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

extension ColorViewController {
    private func setNewColor() {
        mainViewLabel.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    private func setSliders() {
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
}
