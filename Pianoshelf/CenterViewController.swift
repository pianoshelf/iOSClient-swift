//
//  CenterViewController.swift
//  Pianoshelf
//
//  Created by Winston Wu on 2014-11-23.
//  Copyright (c) 2014 pianoshelf. All rights reserved.
//

import UIKit

// The current menu item
enum CurrentMenuItemState {
    case BrowseListView
    case BrowseGridView
}

class CenterViewController: UIViewController {

    var sheetmusicGridViewController : SheetmusicGridViewController?
    var sheetmusicListViewController : SheetmusicTableViewController?
    
    // current state of navigation
    var currentState = CurrentMenuItemState.BrowseListView
    
    let MARGIN_TOP : CGFloat = 120.0

    @IBOutlet weak var gridOrListViewLabel: UIBarButtonItem!
   
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("making request...")
    }

    func addGridView() {
        HTTPClient.sharedInstance.getTopSheetmusic() { (responseObject: NSArray?, error:NSError?) in
            if ((error) != nil) {
                
            } else {
                var sheetmusicList = [Sheetmusic]()
                sheetmusicList = Sheetmusic.sheetmusicListWithJSON(responseObject!)

                // Add the grid view
                self.sheetmusicGridViewController = UIStoryboard.gridViewController()
                self.sheetmusicGridViewController!.sheetmusicList = sheetmusicList
                self.sheetmusicGridViewController!.view.frame = CGRectMake(0, self.MARGIN_TOP, self.sheetmusicGridViewController!.view.frame.width, self.sheetmusicGridViewController!.view.frame.height - 20)
                self.addChildViewController(self.sheetmusicGridViewController!)
                self.view.addSubview(self.sheetmusicGridViewController!.view)
                self.sheetmusicGridViewController!.didMoveToParentViewController(self)
                
                self.currentState = CurrentMenuItemState.BrowseGridView
                self.gridOrListViewLabel.title = "List View"
            }
        }
    }

    func addListView() {
        HTTPClient.sharedInstance.getTopSheetmusic() { (responseObject: NSArray?, error:NSError?) in
            if ((error) != nil) {
                
            } else {
                var sheetmusicList = [Sheetmusic]()
                sheetmusicList = Sheetmusic.sheetmusicListWithJSON(responseObject!)

                // Add the list view
                self.sheetmusicListViewController = UIStoryboard.sheetmusicListController()
                self.sheetmusicListViewController!.sheetmusicList = sheetmusicList
                self.sheetmusicListViewController!.view.frame = CGRectMake(0, self.MARGIN_TOP, self.sheetmusicListViewController!.view.frame.width, self.sheetmusicListViewController!.view.frame.height - 20)
                self.addChildViewController(self.sheetmusicListViewController!)
                self.view.addSubview(self.sheetmusicListViewController!.view)
                self.sheetmusicListViewController!.didMoveToParentViewController(self)
                
                self.currentState = CurrentMenuItemState.BrowseListView
                self.gridOrListViewLabel.title = "Grid View"
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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