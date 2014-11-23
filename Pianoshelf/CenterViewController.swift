//
//  CenterViewController.swift
//  Pianoshelf
//
//  Created by Winston Wu on 2014-11-23.
//  Copyright (c) 2014 pianoshelf. All rights reserved.
//

import UIKit

@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}

// The current menu item
enum CurrentMenuItemState {
    case BrowseListView
    case BrowseGridView
    case Shelf
    case Profile
}

class CenterViewController: UIViewController, MenuViewControllerDelegate {

    var delegate: CenterViewControllerDelegate?

    var sheetmusicGridViewController : SheetmusicGridViewController?
    var sheetmusicListViewController : UITableViewController?
    
    // current state of navigation
    var currentState = CurrentMenuItemState.BrowseListView
    
    @IBOutlet weak var gridOrListViewLabel: UIBarButtonItem!

    @IBAction func toggleSideMenu(sender: AnyObject) {
        if let d = delegate {
            d.toggleLeftPanel?()
        }
    }

    @IBAction func sheetmusicViewToggled(sender: AnyObject) {
        if (currentState == CurrentMenuItemState.BrowseListView) {
            sheetmusicGridViewController = UIStoryboard.gridViewController()
            
            // Remove the list view and view from self
            
            // Add the grid view
            addChildViewController(sheetmusicGridViewController!)
            view.addSubview(sheetmusicGridViewController!.view)
            sheetmusicGridViewController!.didMoveToParentViewController(self)
            
            currentState = CurrentMenuItemState.BrowseGridView
            self.gridOrListViewLabel.title = "List View"
            println("switch to grid")
        }
        else if (currentState == CurrentMenuItemState.BrowseGridView) {
            
            // Remove the grid view controller and view from self
            self.sheetmusicGridViewController?.removeFromParentViewController()
            self.sheetmusicGridViewController?.view.removeFromSuperview()
            
            // Add the list view
            
            currentState = CurrentMenuItemState.BrowseListView
            self.gridOrListViewLabel.title = "Grid View"
            println("switch to list")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func menuItemSelected(itemIndex: Int) {
        switch(itemIndex) {
        case 0:
            // Browse
            
            break
        case 1:
            // My shelf
            break
        case 2:
            // profile
            break
        default:
            //
            break
        }
    }
    
}

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    class func gridViewController() -> SheetmusicGridViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("GridView") as? SheetmusicGridViewController
    }
}