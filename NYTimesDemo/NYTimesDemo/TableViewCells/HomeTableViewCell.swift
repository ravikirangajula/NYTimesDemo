//
//  HomeTableViewCell.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var detailButton: UIButton! {
        didSet {
            detailButton.titleLabel?.text = ""
        }
    }
    @IBOutlet weak var leftLabel: UILabel!
    static let identifier = "HomeTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func configureCell(text: String) {
        self.leftLabel.text = text
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
