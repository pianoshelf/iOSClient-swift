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
    var sheetmusicListViewController : SheetmusicTableViewController?
    
    // current state of navigation
    var currentState = CurrentMenuItemState.BrowseListView
    
    let MARGIN_TOP : CGFloat = 70.0

    @IBOutlet weak var gridOrListViewLabel: UIBarButtonItem!

    @IBAction func toggleSideMenu(sender: AnyObject) {
        if let d = delegate {
            d.toggleLeftPanel?()
        }
    }

    @IBAction func sheetmusicViewToggled(sender: AnyObject) {
        if (currentState == CurrentMenuItemState.BrowseListView) {
            
            // Remove the list view and view from self
            if let listView = self.sheetmusicListViewController {
                listView.removeFromParentViewController()
                listView.view.removeFromSuperview()
            }
            
            addGridView()
        }
        else if (currentState == CurrentMenuItemState.BrowseGridView) {
            
            // Remove the grid view controller and view from self
            if let gridView = self.sheetmusicGridViewController {
                gridView.removeFromParentViewController()
                gridView.view.removeFromSuperview()
            }

            addListView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addListView()
        // Do any additional setup after loading the view.
    }
    
    func addGridView() {
        // Add the grid view
        sheetmusicGridViewController = UIStoryboard.gridViewController()
        sheetmusicGridViewController!.view.frame = CGRectMake(0, MARGIN_TOP, sheetmusicGridViewController!.view.frame.width, sheetmusicGridViewController!.view.frame.height)
        addChildViewController(sheetmusicGridViewController!)
        view.addSubview(sheetmusicGridViewController!.view)
        sheetmusicGridViewController!.didMoveToParentViewController(self)
        
        currentState = CurrentMenuItemState.BrowseGridView
        self.gridOrListViewLabel.title = "List View"
    }
    
    func addListView() {
        // Add the list view
        sheetmusicListViewController = UIStoryboard.sheetmusicListController()
        sheetmusicListViewController!.view.frame = CGRectMake(0, MARGIN_TOP, sheetmusicListViewController!.view.frame.width, sheetmusicListViewController!.view.frame.height)
        addChildViewController(sheetmusicListViewController!)
        view.addSubview(sheetmusicListViewController!.view)
        sheetmusicListViewController!.didMoveToParentViewController(self)
        
        currentState = CurrentMenuItemState.BrowseListView
        self.gridOrListViewLabel.title = "Grid View"
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
        return mainStoryboard().instantiateViewControllerWithIdentifier("SheetmusicGridView") as? SheetmusicGridViewController
    }
    class func sheetmusicListController() -> SheetmusicTableViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("SheetmusicListView") as? SheetmusicTableViewController
    }
}