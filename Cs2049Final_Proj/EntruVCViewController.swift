//
//  EntruVCViewController.swift
//  Cs2049Final_Proj
//
//  Created by haha on 16/5/17.
//  Copyright © 2016年 haha. All rights reserved.
//

import UIKit
import RealmSwift

class EntruVCViewController: UIViewController {
    
    

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var numberText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionSaveData(sender: AnyObject) {
        saveContacts()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    func saveContacts() {
        
        let newContact = Contact()
        newContact.Name = nameText.text!
        newContact.Number = numberText.text!
        
        do {
            let realm = try Realm()
            try realm.write { () -> Void in
                realm.add(newContact)
                print("saved")
            }
        }
        catch{
          print("bug")
        }
        
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
