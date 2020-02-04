//
//  ViewController.swift
//  ColorMixer
//
//  Created by Александр Макаров on 01.02.2020.
//  Copyright © 2020 Aleksander Makarov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - IBOutlets
    
    @IBOutlet var mixedColorField: UIView!
    
    @IBOutlet var redValueLable: UILabel!
    @IBOutlet var greenValueLable: UILabel!
    @IBOutlet var blueValueLable: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        mixedColorField.layer.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        self.redTextField.delegate = self
        self.greenTextField.delegate = self
        self.blueTextField.delegate = self
        
        
    }
    
    // MARK: - Methods
    func updateColor () {
        mixedColorField.layer.backgroundColor = .init(srgbRed: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    // get value from textField and set it in slider
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let numberInGreenField = Float(greenTextField.text ?? "") {
            greenSlider.value = numberInGreenField
        }
        if let numberInRedField = Float(redTextField.text ?? "") {
            redSlider.value = numberInRedField
        }
        
        if let numberInBlueField = Float(blueTextField.text ?? "") {
            blueSlider.value = numberInBlueField
        }
        
        redSliderDrug()
        greenSliderDrug()
        blueSliderDrug()

        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        redTextField.inputAccessoryView = toolBar
        return true
    }
    
    func endEditing () {
        view.endEditing(true)
    }
    //MARK: - IBActions
    @IBAction func redSliderDrug() {
        updateColor()
        redValueLable.text = String(round(redSlider.value * 100) / 100)
    }
    @IBAction func greenSliderDrug() {
        updateColor()
        greenValueLable.text = String(round(greenSlider.value * 100) / 100)
    }
    @IBAction func blueSliderDrug() {
        updateColor()
        blueValueLable.text = String(round(blueSlider.value * 100) / 100)
    }
    
    @IBAction func doneButtonPresst(_ sender: UIBarButtonItem) {
        endEditing()
    }
    
    
}

