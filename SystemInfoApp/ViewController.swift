//
//  ViewController.swift
//  SystemInfoApp
//
//  Created by Nitesh Meshram on 4/10/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {


    @IBOutlet weak var dataSegment: NSSegmentedControl!
    @IBOutlet weak var tableView: NSTableView!
    
    
//    @IBOutlet weak var tableView:NSTableView!
    
    let tableViewData1 = [["column1":"FW Server:","column2":"STATUS:"],
                          ["column1":"FW BOOSTER:","column2":"STATUS:"],
                          ["column1":"OS VERSION:","column2":""],
                          ["column1":"MODEL:","column2":""],
                          ["column1":"IP ADDRESS:","column2":"INTERFACE:"],
                          ["column1":"SERIAL NUMBER:","column2":""],
                          ["column1":"DISK USAGE:","column2":""],
                          ["column1":"AD CONNECTIONS STATUS:","column2":""]
                          ]
    
    
    let tableViewData2 = [["column1":"GATEKEEPER: ON","column2":"CHANGES:"],
                          ["column1":"RAM USAGE: 11GB/16GB ON","column2":"STATUS:"],
                          ["column1":"CPU USAGE: 33%","column2":""],
                          ["column1":"BATTERY CYCLE: 500","column2":"STATUS:"],
                          ["column1":"IP ADDRESS: 10.20.10.20","column2":"INTERFACE: Wi-Fi"],
                          ["column1":"REINSTALL FILEWAVE CLIENT:","column2":""],
                          ["column1":"CLEAR USER CACHE:","column2":"CLEAR MACHINE CACHE:"],
                          ["column1":"AD CONNECTION STATUS:","column2":""],
                          ]
    
    
//    GATEKEEPER: ON CHANGES
//    RAM USAGE: 11GB/16GB STATUS:
//    CPU USAGE: 33%
//    BATTERY CYCLE: 500 STATUS:
//    IP ADDRESS: 10.20 INTERFACE: Wi-Fi
//    REINSTALL FILEWAVE CLIENT
//    CLEAR USER CACHE: CLEAR MACHINE CACHE:
//    AD CONNECTION STATUS:
//
//    var tableViewData: []
    
    var tableViewData = [[String : String]]()//[String]()
    
//    FW Server: STATUS:
//    FW BOOSTER: STATUS
//    OS VERSION:
//    MODEL:
//    IP ADDRESS: INTERFACE: Wi-Fi
//    SERIAL NUMBER:
//    DISK USAGE: 80% Used
//    AD CONNECTIONS STATUS: Bind
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableViewData = tableViewData1
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self as? NSTableViewDelegate
        self.tableView.dataSource = self
        
        self.dataSegment.selectedSegment = 0
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    @IBAction func selectedSegment(_ sender: NSSegmentedControl) {
        
        switch sender.selectedSegment {
        case 0:
            self.tableViewData = tableViewData1

            break
        case 1:
            self.tableViewData = tableViewData2
            break
            
        default:
            break
        }
        tableView.reloadData()
        

    }
    

}



extension ViewController:NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableViewData.count
    }
}


extension ViewController: NSTableViewDelegate {
    
    fileprivate enum CellIdentifiers {
        static let column1 = "column1"
        static let column2 = "column2"
        //        static let SizeCell = "SizeCellID"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var text: String = ""
        var cellIdentifier: String = ""
        
        
        let item = self.tableViewData[row]
        
        


        print(item)
        
        // 2
        if tableColumn == tableView.tableColumns[0] {
//            image = item.icon
            text = item["column1"]!
            cellIdentifier = CellIdentifiers.column1
        } else if tableColumn == tableView.tableColumns[1] {
//            text = dateFormatter.string(from: item.date)
            text = item["column2"]!
            cellIdentifier = CellIdentifiers.column2

        }


        // 3
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            return cell
        }
        return nil
    }
}

