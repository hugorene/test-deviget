//
//  EntryHandler.swift
//  test
//
//  Created by tde_sistemas on 4/1/17.
//  Copyright © 2017 Hugo. All rights reserved.
//

import Foundation

class EntryHandler {
    static func getEntries(after: String, completion: @escaping (_ result: [Entry], _ after: String) -> Void) {
        EntryService.getEntries(after: after) { (result, after) in
            completion(result, after)
        }
    }
}
