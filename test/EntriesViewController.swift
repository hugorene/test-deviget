//
//  ViewController.swift
//  test
//
//  Created by tde_sistemas on 3/28/17.
//  Copyright © 2017 Hugo. All rights reserved.
//

import UIKit
import CoreData

class EntriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EntryTableViewCellDelegate {
    
    @IBOutlet weak var entriesTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    var entries: [Entry] = []
    var after = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        entriesTableView.rowHeight = UITableViewAutomaticDimension
        entriesTableView.estimatedRowHeight = 140
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.activityIndicatorView.startAnimating()
        EntryHandler.getEntries(after: after) { (entries, after) in
            self.after = after
            self.entries = entries
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
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
        cell.delegate = self        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.entries.count-1 {
            self.activityIndicatorView.startAnimating()
            EntryHandler.getEntries(after: self.after) { (entries, after) in
                self.after = after
                let mergedArray = [self.entries, entries].flatMap({ (element: [Entry]) -> [Entry] in
                    return element
                })
                
                self.entries = mergedArray
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.entriesTableView.reloadData()
                }
            }
        }
    }
    
    
    // MARK: - EntryTableViewCellDelegate
    
    func selectedPicture(picture: UIImage) {
        self.performSegue(withIdentifier: "FullPictureSegue", sender: picture)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let picture = sender as! UIImage
        let fullPictureViewController = segue.destination as! FullPictureViewController
        fullPictureViewController.picture = picture
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        coder.encode(self.entriesTableView.contentOffset, forKey: "contentOffset")
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        if let contentOffset = coder.decodeCGPoint(forKey: "contentOffset") as? CGPoint {
            self.entriesTableView.contentOffset = contentOffset
        }
    }
    
}

