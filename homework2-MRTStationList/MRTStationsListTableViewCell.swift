//
//  MRTStationsListTableViewCell.swift
//  homework2-MRTStationList
//
//  Created by Jenny Huang on 2016/5/5.
//  Copyright © 2016年 Jenny Huang. All rights reserved.
//

import UIKit

class MRTStationsListTableViewCell: UITableViewCell {

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var line1Label: UILabel!
    @IBOutlet weak var line2Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLineLabelBackgroundColor(line: String, label: UILabel) {
        switch line {
        case "板南線":
            label.backgroundColor = UIColor(red: 0, green: 94/255.0, blue: 184/255.0, alpha: 1)
        case "文湖線":
            label.backgroundColor = UIColor(red: 158/255.0, green: 101/255.0, blue: 46/255.0, alpha: 1)
        case "中和新蘆線":
            label.backgroundColor = UIColor(red: 255/255.0, green: 163/255.0, blue: 0, alpha: 1)
        case "淡水信義線":
            label.backgroundColor = UIColor(red: 203/255.0, green: 44/255.0, blue: 48/255.0, alpha: 1)
        case "松山新店線":
            label.backgroundColor = UIColor(red: 0, green: 119/255.0, blue: 73/255.0, alpha: 1)
        case "小碧潭支線":
            label.backgroundColor = UIColor(red: 206/255.0, green: 220/255.0, blue: 0, alpha: 1)
        case "新北投支線":
            label.backgroundColor = UIColor(red: 248/255.0, green: 144/255.0, blue: 165/255.0, alpha: 1)
        case "貓空纜車":
            label.backgroundColor = UIColor(red: 119/255.0, green: 185/255.0, blue: 51/255.0, alpha: 1)
        default:
            break
        }
    }

}
