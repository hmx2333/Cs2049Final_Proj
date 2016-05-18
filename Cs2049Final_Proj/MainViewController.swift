//
//  MainViewController.swift
//  Cs2049Final_Proj
//
//  Created by haha on 16/5/17.
//  Copyright © 2016年 haha. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func Slider(sender: UISlider) {
        var sliderValue = lroundf(sender.value)
        label.text = "\(sliderValue)"
    }
    
       

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
