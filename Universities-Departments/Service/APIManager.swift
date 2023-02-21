//
//  APIManager.swift
//  Universities-Departments
//
//  Created by İbrahim Bayram on 18.02.2023.
//

import Foundation

public class APIService {
    private var urlString = "https://raw.githubusercontent.com/anilozmen/TR-iller-universiteler-JSON/master/province-universities.json"
    
    func callApi(completion : @escaping([Province]?)->()) {
        guard let resourceURL = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in
            guard let data = data else {return}
            guard error == nil else {
                print("error occurs")
                return
                
            }
                let jsonData = try? JSONDecoder().decode([Province].self, from: data)
                guard let jsonData = jsonData else {return}
                completion(jsonData)
            
        }.resume()
    }
}

