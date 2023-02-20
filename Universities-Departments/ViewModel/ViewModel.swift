//
//  ViewModel.swift
//  Universities-Departments
//
//  Created by İbrahim Bayram on 18.02.2023.
//

import Foundation

struct ProvinceListViewModel {
    //Fetch provinces as an array
    func getProvinces(completion: @escaping([String]) -> ()){
        var list = [Province]()
        var resultList = [String]()
        APIService().callApi { dataList in
            guard let dataList = dataList else {return}
            list = dataList
            print(list[1].province)
            for i in dataList {
                resultList.append(i.province)
                print(resultList)
                completion(resultList)
            }
        }
    }

    

}
struct UniversityListViewModel {
    func getUniversities(completion : @escaping([[String]])-> ()) {
        var provinceList = [Province]()
        APIService().callApi { provinces in
            guard let provinces = provinces else {return}
            provinceList = provinces
        }
        var uninameList = [String]()
        var uniNameArray = [[String]]()
        for province in provinceList {
            for uni in province.universities {
                uninameList.append(uni.name)
                print(uni.name)
            }
            uniNameArray.append(uninameList)
            uninameList.removeAll(keepingCapacity: false)
            completion(uniNameArray)
        }
    }

}
