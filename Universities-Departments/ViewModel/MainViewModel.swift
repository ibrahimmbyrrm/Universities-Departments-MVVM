//
//  ViewModel.swift
//  Universities-Departments
//
//  Created by İbrahim Bayram on 18.02.2023.
//

import Foundation
import UIKit

struct ProvinceListViewModel {
    //Fetch provinces as an array
    func getProvinces(completion: @escaping([String], [[University]]) -> ()){
        var resultList = [String]()
        var uniArray = [University]()
        var matrisUniArray = [[University]]()
        APIService().callApi { provinces in
            guard let provinces = provinces else {return}
            //print(list[1].province)
            for province in provinces {
                resultList.append(province.province)
                uniArray.removeAll()
                for i in province.universities {
                    uniArray.append(i)
                }
                matrisUniArray.append(uniArray)
            }
            //Completion kodunun for looptan çıkarınca problemimiz büyük ölçekte çözüldü.
            completion(resultList, matrisUniArray)
        }
    }
}
struct TableViewCellViewModel {
    func cellForRowAt(arr : [[University]], indexPath : IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let sectionData = arr[indexPath.section]
        let university = sectionData[safe: indexPath.row]
        cell.textLabel?.text = university?.name
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


