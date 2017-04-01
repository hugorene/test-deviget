//
//  EntryHandler.swift
//  test
//
//  Created by tde_sistemas on 4/1/17.
//  Copyright © 2017 Hugo. All rights reserved.
//

import Foundation

class EntryHandler {
    static func getEntries(completion: @escaping (_ result: [Entry]) -> Void) {
        EntryService.getEntries { (result) in
            completion(result)
        }
    }
}
