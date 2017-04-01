//
//  ViewController.swift
//  test
//
//  Created by tde_sistemas on 3/28/17.
//  Copyright © 2017 Hugo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       EntryHandler.getEntries { (entries) in
        print(entries)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

