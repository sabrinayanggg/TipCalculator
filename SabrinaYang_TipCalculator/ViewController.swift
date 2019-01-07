//
//  ViewController.swift
//  SabrinaYang_TipCalculator
//
//  Created by sabrina on 1/6/19.
//  Copyright © 2019 sabrina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        //when main view tapped, get rid of keyboard
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        //When field changed, update tip and total
        
        let bill = Double(billField.text!) ?? 0
        //returns default value if nil (not a valid #)
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
            //multiply by tipPercentages at index of selected index
        
        let total  = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

