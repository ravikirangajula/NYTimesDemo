//
//  ArticlesDetailsTableViewCell.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class ArticlesDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedDatelabel: UILabel!
    var detailItem: results?
    
    static let identifier = "ArticlesDetailsTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(item: results) {
        self.titleLabel.text = item.title
        self.publishedDatelabel.text = item.published_date
    }
    
    func configureSearchCell(item: docs) {
        self.titleLabel.text = item.headline?.main
        self.publishedDatelabel.text = item.pubDate
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
