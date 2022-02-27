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
    var detailItem: Results?
    
    static let identifier = "ArticlesDetailsTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func configureCell(item: Results) {
        self.titleLabel.text = item.title
        self.publishedDatelabel.text = "Published on: \(item.published_date ?? "")"
    }
    
    func configureSearchCell(item: Docs) {
        self.titleLabel.text = item.headline?.main
        self.publishedDatelabel.text = "Published on: \(item.pubDate ?? "")"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
