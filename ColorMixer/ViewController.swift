//
//  ViewController.swift
//  ColorMixer
//
//  Created by Александр Макаров on 01.02.2020.
//  Copyright © 2020 Aleksander Makarov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet var mixedColorField: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mixedColorField.layer.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
    }
    // MARK: - Methods
    func updateColor () {
        mixedColorField.layer.backgroundColor = .init(srgbRed: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
  
    //MARK: - IBActions
    @IBAction func redSliderDrug() {
        updateColor()
        redValue.text = String(round(redSlider.value * 100) / 100)
    }
    @IBAction func greenSliderDrug() {
        updateColor()
        greenValue.text = String(round(greenSlider.value * 100) / 100)
    }
    
    @IBAction func blueSliderDrug() {
        updateColor()
        blueValue.text = String(round(blueSlider.value * 100) / 100)
    }
}

