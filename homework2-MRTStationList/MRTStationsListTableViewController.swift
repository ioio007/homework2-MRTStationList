//
//  MRTStationsListTableViewController.swift
//  homework2-MRTStationList
//
//  Created by Jenny Huang on 2016/5/1.
//  Copyright © 2016年 Jenny Huang. All rights reserved.
//

import UIKit

class MRTStationsListTableViewController: UITableViewController {
    
    var MRTstationsData: MRTStationsData!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = try? MRTStationsData() else {
            fatalError()
        }
        self.MRTstationsData = data
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.MRTstationsData.lines.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.MRTstationsData.lines[section].MRTStations.count

    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MRTStationsListTableViewCell
        
         //Configure the cell...
        let MRTStation = self.MRTstationsData.lines[indexPath.section].MRTStations[indexPath.row]
        
        cell.stationNameLabel.text = MRTStation.name
        
        if MRTStation.line.count == 1 {
            // no 2 lines
            cell.line2Label.hidden = true
            print(cell.line1Label.hidden)
            cell.line1Label.text = MRTStation.stationNumber[0]
            cell.line1Label.textColor = UIColor.whiteColor()
            cell.setLineLabelBackgroundColor(MRTStation.line[0], label: cell.line1Label)

        }
        else {
            cell.line2Label.hidden = false
            cell.line1Label.text = MRTStation.stationNumber[0]
            cell.line2Label.text = MRTStation.stationNumber[1]
            cell.line1Label.textColor = UIColor.whiteColor()
            cell.line2Label.textColor = UIColor.whiteColor()
            cell.setLineLabelBackgroundColor(MRTStation.line[0], label: cell.line1Label)
            cell.setLineLabelBackgroundColor(MRTStation.line[1], label: cell.line2Label)
            
        }
        

        

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.MRTstationsData.lines[section].name
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
                
        let header = view as! UITableViewHeaderFooterView
        header.textLabel!.font = UIFont(name: "HelveticaNeue-Bold", size: 20)!
        
    }


    // MARK: - Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "ShowDetail" {
            guard let detailViewController = segue.destinationViewController as? MRTStationDetailViewController else {
                return
            }
            guard let cell = sender as? UITableViewCell else { return }
            let indexPath = self.tableView.indexPathForCell(cell)!
            let MRTstation = self.MRTstationsData.lines[indexPath.section].MRTStations[indexPath.row]
            detailViewController.MRTstation = MRTstation
        }
    }



}
