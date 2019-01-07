//
//  SettingsViewController.swift
//  SabrinaYang_TipCalculator
//
//  Created by sabrina on 1/6/19.
//  Copyright © 2019 sabrina. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    

    @IBOutlet weak var newPercent: UITextField!
    
    @IBOutlet weak var newTipMenu: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let percent = defaults.string(forKey: "tip") ?? "10"
        let percent2 = defaults.string(forKey: "tip2") ?? "15"
        let percent3 = defaults.string(forKey: "tip3") ?? "20"
        
        newTipMenu.setTitle("\(percent)%", forSegmentAt: 0)
        newTipMenu.setTitle("\(percent2)%", forSegmentAt: 1)
        newTipMenu.setTitle("\(percent3)%", forSegmentAt: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changePercent(_ sender: Any) {
        //load defaults and change defaults based on selected percent
        let defaults = UserDefaults.standard
        if newTipMenu.selectedSegmentIndex == 0{
        defaults.set(newPercent.text, forKey: "tip")
        }
        if newTipMenu.selectedSegmentIndex == 1{
        defaults.set(newPercent.text, forKey: "tip2")
        }
        if newTipMenu.selectedSegmentIndex == 2{
        defaults.set(newPercent.text, forKey: "tip3")
        }
        defaults.synchronize()
        
        let percent = defaults.string(forKey: "tip") ?? "10"
        let percent2 = defaults.string(forKey: "tip2") ?? "15"
        let percent3 = defaults.string(forKey: "tip3") ?? "20"
        
        newTipMenu.setTitle("\(percent)%", forSegmentAt: 0)
        newTipMenu.setTitle("\(percent2)%", forSegmentAt: 1)
        newTipMenu.setTitle("\(percent3)%", forSegmentAt: 2)
        
        //puts changes in menu
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
