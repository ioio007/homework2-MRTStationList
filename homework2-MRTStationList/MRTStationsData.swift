//
//  MRTStationsData.swift
//  homework2-MRTStationList
//
//  Created by Jenny Huang on 2016/5/1.
//  Copyright © 2016年 Jenny Huang. All rights reserved.
//

import Foundation
import ObjectMapper

struct Line {
    var name: String = ""
    var MRTStations: [MRTStation]
}

struct MRTStation {
    var name: String = ""
    var information: [String : String]!
    var line: [String] = []
    var stationNumber: [String] = []

}

extension MRTStation: Mappable {
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        self.name <- map["name"]
        self.information <- map["lines"]
        
    }
    
}

struct MRTStationsData {
    
    let lines: [Line]
    
    init?() throws {
        // complete MRTStation (line, stationNumber)
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("MRT", ofType: "json")!
        let jsonContent = try! String(contentsOfFile: path)
        
        var MRTStationsArray = Mapper<MRTStation>().mapArray(jsonContent)!
        
        
        for i in 1...MRTStationsArray.endIndex {
            for (key, value) in MRTStationsArray[i-1].information {
                MRTStationsArray[i-1].line.append(key)
                MRTStationsArray[i-1].stationNumber.append(value)
            }
        }

        // Group MRTStations by Lines
        var MRTStationDict = [String: [MRTStation]]()
        for MRTstation in MRTStationsArray {
            for i in 1...MRTstation.line.count {
                if MRTStationDict[MRTstation.line[i-1]] == nil {
                    MRTStationDict[MRTstation.line[i-1]] = []
                }
                MRTStationDict[MRTstation.line[i-1]]!.append(MRTstation)
            }
        }
        // Create instances of Lines with MRTStations
        var lines: [Line] = []
        for (lineName, MRTStationsList) in MRTStationDict {
            let line = Line(name: lineName, MRTStations: MRTStationsList)
            
            lines.append(line)
        }
        
        self.lines = lines

    }
}

