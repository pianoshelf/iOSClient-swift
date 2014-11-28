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
    
    var imageData = [String]()
    
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

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var sheetmusic = sheetmusicList[indexPath.row]
        
        HTTPClient.sharedInstance.getSheetmusicDetail(sheetmusic.id){ (responseObject: NSObject?, error:NSError?) in
            
            var imagesResp = responseObject!.valueForKey("images") as NSArray
            var imageList = SheetmusicPages.sheetmusicPagesWithJSON(imagesResp)
            
            self.imageData = imageList
            self.performSegueWithIdentifier("listToDetail", sender: self)
        }
    }
    
    // this method mush be in first view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "listToDetail"{
                var rootViewCtrl = segue.destinationViewController as RootSheetmusicPagesViewController
                
                var indexPath = self.tableView.indexPathForSelectedRow() //get index of data for selected row
                var sheetmusic = sheetmusicList[indexPath!.row]
    
                // create the model controller with the page data
                var modelCtrl = ModelController()
                modelCtrl.pageData = imageData
                
                // inject the model controller
                rootViewCtrl._modelController = modelCtrl
            }
    }
    
}
