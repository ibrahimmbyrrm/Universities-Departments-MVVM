//
//  CellViewModel.swift
//  Universities-Departments
//
//  Created by İbrahim Bayram on 21.02.2023.
//

import Foundation
import UIKit

struct TableViewCellViewModel {
    func cellForRowAt(arr : [[University]], indexPath : IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let sectionData = arr[indexPath.section]
        let university = sectionData[safe: indexPath.row]
        cell.textLabel?.text = university?.name
        cell.backgroundColor = UIColor(red: 0.62, green: 0.97, blue: 0.93, alpha: 1.00)
        return cell
    }
    func numberOfRowsInSection(arr : [[University]], section : Int) -> Int {
        if let sectionData = arr[safe: section] {
            return sectionData.count
        }else {
            return 0
        }
    }
   
}
