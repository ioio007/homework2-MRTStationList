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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

         //Configure the cell...
        let MRTStation = self.MRTstationsData.lines[indexPath.section].MRTStations[indexPath.row]
        
        cell.textLabel?.text = MRTStation.name

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
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        guard let segueIdentifier = segue.identifier else {
//            return
//        }
//        
//        if segueIdentifier == "ShowDetail" {
//            guard let detailViewController = segue.destinationViewController as? AirportDetailViewController else {
//                return
//            }
//            guard let cell = sender as? UITableViewCell else { return }
//            let indexPath = self.tableView.indexPathForCell(cell)!
//            let airport = self.airportsData.countries[indexPath.section].airports[indexPath.row]
//            detailViewController.airport = airport
//        }
//    }



}
