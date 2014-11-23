//
//  Sheetmusic.swift
//  Pianoshelf
//
//  Created by Winston Wu on 2014-11-23.
//  Copyright (c) 2014 pianoshelf. All rights reserved.
//

import Foundation

class Sheetmusic {
    var id: Int
    var title: String
    var style: String
    var key: String
    var composerName: String
    var thumbnailUrl: String
    
    init(id:Int, title: String, style:String, key:String, composerName: String, thumbnailUrl: String) {
        self.id = id
        self.title = title
        self.style = style
        self.key = key
        self.composerName = composerName
        self.thumbnailUrl = thumbnailUrl
    }
    
    class func sheetmusicListWithJSON(allResults: NSArray) -> [Sheetmusic] {
        var sheetmusicList = [Sheetmusic]()

        // Store the results in the table data array
        if allResults.count > 0 {
            
            for result in allResults {
                var id = result["id"] as Int
                var title = result["title"] as String
                var style = result["style"] as String
                var key = result["key"] as String
                var composerName = result["composer_name"] as String
                var thumbnailUrl = result["thumbnail_url"] as String
                
                var sheetmusic = Sheetmusic(id : id, title: title, style: style, key: key, composerName: composerName, thumbnailUrl: thumbnailUrl)
                sheetmusicList.append(sheetmusic)
            }
            
        }
        return sheetmusicList
    }
}
