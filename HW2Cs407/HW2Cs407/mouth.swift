//
//  mouth.swift
//  HW2Cs407
//
//  Created by ZhangYipeng on 16/3/11.
//  Copyright © 2016年 ZhangYipeng. All rights reserved.
//

import UIKit

class mouth: UITableViewController {
    var months: [String] = ["Jan", "Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    var numDays = 0
    var month = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return months.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("monthcell", forIndexPath: indexPath)
        
        cell.textLabel?.text = months[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //let storyboard = UIStoryboard(name: "storyboard", bundle: nil);
        //let days = storyboard.instantiateViewControllerWithIdentifier("DaysTableViewController") as! UITableViewController
        //let destinationVC:DaysTableViewController = DaysTableViewController()
        let row = indexPath.row
        
        if ( row == 0 || row == 2 || row==4 || row==6 || row==7 || row==9 || row==11){
            numDays = 31
            //destinationVC.daysInt = numDays
            
        }
        else if(row == 1){
            numDays = 28
            //destinationVC.daysInt = numDays
        }
        else{
            numDays = 30
            //destinationVC.daysInt = numDays
        }
        
        self.performSegueWithIdentifier("toDate", sender: nil)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "toDate") {
            let vc: day = segue.destinationViewController as! day
            vc.daysInt = numDays
            vc.month = month
        }
        
    }
    
}