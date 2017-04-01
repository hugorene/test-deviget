//
//  EntryService.swift
//  test
//
//  Created by tde_sistemas on 3/28/17.
//  Copyright © 2017 Hugo. All rights reserved.
//

import Foundation

class EntryService {
    
    static func getEntries(completion: @escaping (_ result: Any) -> Void) {
        
        let entryEndpoint: String = Global.urlEntry
        guard let url = URL(string: entryEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                print("Error: calling entry service")
                print(error)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                    print("Error: trying to convert data to JSON")
                    return
                }
                completion(todo)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        
        task.resume()
    }
    
}
