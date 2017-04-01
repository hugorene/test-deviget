//
//  Entry.swift
//  test
//
//  Created by tde_sistemas on 4/1/17.
//  Copyright © 2017 Hugo. All rights reserved.
//

import Foundation

struct Entry {
    let title: String
    let author: String
    let created: Int
    let thumbnail: String
    let num_comments: Int
    
    init?(json: [String: Any]) {
        guard let title = json["title"] as? String,
            let author = json["author"] as? String,
            let created = json["created"] as? Int,
            let thumbnail = json["thumbnail"] as? String,
            let num_comments = json["num_comments"] as? Int
        else {
                return nil
        }
        
        self.title = title
        self.author = author
        self.created = created
        self.thumbnail = thumbnail
        self.num_comments = num_comments
        
    }
}
