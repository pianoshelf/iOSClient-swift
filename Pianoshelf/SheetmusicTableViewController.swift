//
//  SheetmusicTableViewController.swift
//  Pianoshelf
//
//  Created by Winston Wu on 2014-11-23.
//  Copyright (c) 2014 pianoshelf. All rights reserved.
//

import UIKit


class SheetmusicTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SheetmusicCell", forIndexPath: indexPath) as UITableViewCell
        return cell
    }
}
