//
//  ViewController.swift
//  test
//
//  Created by tde_sistemas on 3/28/17.
//  Copyright © 2017 Hugo. All rights reserved.
//

import UIKit

class EntriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    @IBOutlet weak var entriesTableView: UITableView!
    var entries: [Entry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        entriesTableView.rowHeight = UITableViewAutomaticDimension
        entriesTableView.estimatedRowHeight = 140
        
                
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        EntryHandler.getEntries { (entries) in
            self.entries = entries
            
            DispatchQueue.main.async {
                self.entriesTableView.reloadData()
            }
            
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entries.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as! EntryTableViewCell
        let entry = self.entries[indexPath.row]
        cell.setData(entry: entry)
        return cell
    }
    
   // func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
   //     return 100
   // }


}

