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
        let defaults = UserDefaults.standard
        let percent = defaults.string(forKey: "tip") ?? "10"
        let percent2 = defaults.string(forKey: "tip2") ?? "15"
        let percent3 = defaults.string(forKey: "tip3") ?? "20"
        
        tipControl.setTitle("\(percent)%", forSegmentAt: 0)
        tipControl.setTitle("\(percent2)%", forSegmentAt: 1)
        tipControl.setTitle("\(percent3)%", forSegmentAt: 2)
        
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
        let defaults = UserDefaults.standard
        let percent = defaults.string(forKey: "tip") ?? "10"
        let percent2 = defaults.string(forKey: "tip2") ?? "15"
        let percent3 = defaults.string(forKey: "tip3") ?? "20"
        
        tipControl.setTitle("\(percent)%", forSegmentAt: 0)
        tipControl.setTitle("\(percent2)%", forSegmentAt: 1)
        tipControl.setTitle("\(percent3)%", forSegmentAt: 2)
        
        let tipPercentages = [percent, percent2, percent3]
        //When field changed, update tip and total
        
        let bill = Double(billField.text!) ?? 0
        //returns default value if nil (not a valid #)
        
        let tip = bill * (Double(tipPercentages[tipControl.selectedSegmentIndex])!/100)
            //multiply by tipPercentages at index of selected index
        
        let total  = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }

    
    
}

