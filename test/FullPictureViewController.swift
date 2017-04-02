//
//  FullPictureViewController.swift
//  test
//
//  Created by tde_sistemas on 4/1/17.
//  Copyright © 2017 Hugo. All rights reserved.
//

import UIKit

class FullPictureViewController: UIViewController {
    
    var picture: UIImage?
    @IBOutlet weak var pictureImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pictureImageView.image = picture
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
