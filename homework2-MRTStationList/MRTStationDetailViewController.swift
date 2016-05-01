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

    var MRTstation: MRTStation? {
        
        didSet(newMRTstation) {
            if self.isViewLoaded() {
                self.fillData()
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()

    }

    func fillData(){
        guard let MRTstation = self.MRTstation else {
            return
        }
        self.MRTStationNameLabel.text = MRTstation.name
        
        
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
