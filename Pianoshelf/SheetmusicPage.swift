//
//  SheetmusicPage.swift
//  Pianoshelf
//
//  Created by Winston Wu on 2014-11-28.
//  Copyright (c) 2014 pianoshelf. All rights reserved.
//
import Foundation

class SheetmusicPages {
    
    class func sheetmusicPagesWithJSON(imageObjects: NSArray) -> [String] {
        var images = [String]()
        
        if (imageObjects.count > 0) {
            for image in imageObjects {
                
                var imgUrl = image["url"] as? String
                images.append(imgUrl!)
            }
        }
        
        return images
    }
}
