//
//  SidePanelViewController.swift
//  Pianoshelf
//
//  Created by Winston Wu on 2014-11-23.
//  Copyright (c) 2014 pianoshelf. All rights reserved.
//

import UIKit

@objc
protocol MenuViewControllerDelegate {
    func menuItemSelected(itemIndex : Int)
}

class SidePanelViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var delegate: MenuViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var inset: UIEdgeInsets = UIEdgeInsetsMake(30, 0, 0, 0)
        self.tableView.contentInset = inset
        var height: CGFloat = 170
    }
    
    // Mark: Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.menuItemSelected(indexPath.row)
    }
}
