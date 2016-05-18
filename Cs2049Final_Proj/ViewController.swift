//
//  ViewController.swift
//  Cs2049Final_Proj
//
//  Created by haha on 16/5/17.
//  Copyright © 2016年 haha. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource: Results<Contact>!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        reloadTheTable()
    }
    
    func reloadTheTable() {
        do {
        let realm = try Realm()
        dataSource = realm.objects(Contact)
        tableView?.reloadData()
        }
        catch {
            
        }
    }
    func setUpUI() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUpUI()
        reloadTheTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "myCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: identifier)
            
        }
        let currentContact = dataSource[indexPath.row]
        cell?.textLabel?.text = currentContact.Name
        cell?.detailTextLabel?.text = currentContact.Number
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Selected row at \(indexPath.row)")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myheader = UIView(frame: CGRectMake(0, 0, tableView.frame.width, 80))
        myheader.backgroundColor = UIColor.yellowColor()
        return myheader
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }

    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let myFooter = UIView(frame: CGRectMake(0, 0, tableView.frame.width, 80))
        myFooter.backgroundColor = UIColor.purpleColor()
        return myFooter
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
    
    @IBAction func actionGo2EntryVC(sender: AnyObject) {
        performSegueWithIdentifier("goToEntryViewController", sender: nil)
    }
    
    
    
    
    
    

}

