//
//  MainViewController.swift
//  TaskTwoSliders
//
//  Created by Александр Соболев on 30.07.2022.
//

import UIKit

protocol ColorViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class MainViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as? ColorViewController
        colorVC?.delegate = self
        colorVC?.viewColor = view.backgroundColor
    }
}

//MARK: - ColorDelegate
extension MainViewController: ColorViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
