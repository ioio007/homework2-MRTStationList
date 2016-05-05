//
//  MRTStationDetailViewController.swift
//  homework2-MRTStationList
//
//  Created by Jenny Huang on 2016/5/1.
//  Copyright © 2016年 Jenny Huang. All rights reserved.
//

import UIKit

class MRTStationDetailViewController: UIViewController {

    @IBOutlet weak var MRTStationNameLabel: UILabel!
    @IBOutlet weak var lineNameLabel2: UILabel!
    @IBOutlet weak var lineNameLabel: UILabel!
    @IBOutlet weak var MRTStationNameNavigationItem: UINavigationItem!

    @IBOutlet weak var lineColorView: UIView!
    @IBOutlet weak var lineColorView2: UIView!
    var MRTstation: MRTStation? {
        didSet {
            self.fillData()
        }
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.fillData()

    }

    func fillData(){
        guard self.isViewLoaded() else {
            return
        }
        self.MRTStationNameLabel.text = MRTstation?.name
        self.MRTStationNameNavigationItem.title = MRTstation?.name
        
        if MRTstation?.line.count == 1 {
            // no 2 lines
            lineNameLabel2.hidden = true
            lineColorView2.hidden = true
            fillColor((MRTstation?.line[0])!, view: lineColorView)
            lineNameLabel.text = MRTstation?.line[0]
            lineNameLabel.textColor = UIColor.whiteColor()
            
        }
        else {
            lineColorView2.hidden = false
            lineNameLabel2.hidden = false
            fillColor((MRTstation?.line[0])!, view: lineColorView)
            fillColor((MRTstation?.line[1])!, view: lineColorView2)
            lineNameLabel.text = MRTstation?.line[0]
            lineNameLabel2.text = MRTstation?.line[1]
            lineNameLabel.textColor = UIColor.whiteColor()
            lineNameLabel2.textColor = UIColor.whiteColor()

        }
        
    }
    
    func fillColor(line: String, view: UIView) {
        switch line {
        case "板南線":
            view.backgroundColor = UIColor(red: 0/255.0, green: 94/255.0, blue: 184/255.0, alpha: 1)
        case "文湖線":
            view.backgroundColor = UIColor(red: 158/255.0, green: 101/255.0, blue: 46/255.0, alpha: 1)
        case "中和新蘆線":
            view.backgroundColor = UIColor(red: 255/255.0, green: 163/255.0, blue: 0, alpha: 1)
        case "淡水信義線":
            view.backgroundColor = UIColor(red: 203/255.0, green: 44/255.0, blue: 48/255.0, alpha: 1)
        case "松山新店線":
            view.backgroundColor = UIColor(red: 0, green: 119/255.0, blue: 73/255.0, alpha: 1)
        case "小碧潭支線":
            view.backgroundColor = UIColor(red: 206/255.0, green: 220/255.0, blue: 0, alpha: 1)
        case "新北投支線":
            view.backgroundColor = UIColor(red: 248/255.0, green: 144/255.0, blue: 165/255.0, alpha: 1)
        case "貓空纜車":
            view.backgroundColor = UIColor(red: 119/255.0, green: 185/255.0, blue: 51/255.0, alpha: 1)
        default:
            break
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
