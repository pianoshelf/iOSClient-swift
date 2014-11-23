//
//  HTTPClient.swift
//  Pianoshelf
//
//  Created by Winston Wu on 2014-11-23.
//  Copyright (c) 2014 pianoshelf. All rights reserved.
//

import Foundation
import Alamofire

typealias ListResponse = (NSArray?, NSError?) -> Void

class HTTPClient {
    //let baseUrl = "http://localhost:5000/api/"
    let baseUrl = "http://198.46.142.228:5000/api/"

    class var sharedInstance:HTTPClient {
        struct Singleton {
            static let instance = HTTPClient()
        }
        return Singleton.instance
    }
    
    func getTopSheetmusic(onCompletion: ListResponse) -> Void {
        Alamofire.request(.GET, baseUrl + "sheetmusic/")
            .responseJSON { (_, _, JSON, _) in
                let results: NSArray = JSON?.valueForKeyPath("results") as NSArray
                
                onCompletion(results, nil)
        }
    }
}
