//
//  Entry.swift
//  test
//
//  Created by tde_sistemas on 4/1/17.
//  Copyright © 2017 Hugo. All rights reserved.
//

import Foundation

class Entry: NSObject {
    let title: String
    let author: String
    let created_utc: Int
    let thumbnail: String
    let num_comments: Int
    
    init?(json: [String: Any]) {
        guard let title = json["title"] as? String,
            let author = json["author"] as? String,
            let created_utc = json["created_utc"] as? Int,
            let thumbnail = json["thumbnail"] as? String,
            let num_comments = json["num_comments"] as? Int
        else {
                return nil
        }
        
        self.title = title
        self.author = author
        self.created_utc = created_utc
        self.thumbnail = thumbnail
        self.num_comments = num_comments
        
    }
}
