//
//  EntryTableViewCell.swift
//  test
//
//  Created by tde_sistemas on 4/1/17.
//  Copyright © 2017 Hugo. All rights reserved.
//

import UIKit

protocol EntryTableViewCellDelegate {
    func selectedPicture(picture: UIImage)
}

class EntryTableViewCell: UITableViewCell {
    
    var delegate: EntryTableViewCellDelegate?
    var urlPicture: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateAuthorLabel: UILabel!
    @IBOutlet weak var numberCommentsLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(entry: Entry){
        self.titleLabel.text = entry.title
        self.dateAuthorLabel.text = getHoursAgo(timestamp: entry.created_utc) + " by " + entry.author
        self.numberCommentsLabel.text =  "\(entry.num_comments) comments"
        downloadImage(url: URL(string: entry.thumbnail)!)
        setPictureGesture(urlPicture: entry.thumbnail)
    }
    
    func downloadImage(url: URL) {
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                self.thumbnailImageView.image = UIImage(data: data)
            }
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func getHoursAgo(timestamp: Int) -> String {
        
        let currentDate = NSDate();
        let dateEntry = NSDate(timeIntervalSince1970: TimeInterval(timestamp))

        let calendar = NSCalendar.current
        let unitFlags = Set<Calendar.Component>([.hour])
        let components = calendar.dateComponents(unitFlags, from: dateEntry as Date, to: currentDate as Date)
 
        if components.hour! >= 2 {
            return "\(components.hour!) hours ago"
        } else {
            return "1 hours ago"
        }
    
    }
    
    func setPictureGesture(urlPicture: String) {
        self.thumbnailImageView.isUserInteractionEnabled = true
        self.urlPicture = urlPicture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedOnImage(_:)))
        tapGesture.numberOfTapsRequired = 1
        
        self.thumbnailImageView?.addGestureRecognizer(tapGesture)

    }
    
    func tappedOnImage(_ sender: UITapGestureRecognizer) {
        delegate?.selectedPicture(picture: self.thumbnailImageView.image!)
    }
}
