//
//  SheetmusicTableViewController.swift
//  Pianoshelf
//
//  Created by Winston Wu on 2014-11-23.
//  Copyright (c) 2014 pianoshelf. All rights reserved.
//

import UIKit


class SheetmusicTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var sheetmusicList = [Sheetmusic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sheetmusicList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SheetmusicCell", forIndexPath: indexPath) as UITableViewCell
        var sheetmusic = sheetmusicList[indexPath.row]
        
        cell.textLabel.text = sheetmusic.title
        cell.detailTextLabel?.text = "\(sheetmusic.style) by \(sheetmusic.composerName)"
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
}
