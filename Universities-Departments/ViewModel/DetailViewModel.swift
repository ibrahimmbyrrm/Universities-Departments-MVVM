//
//  DetailViewModel.swift
//  Universities-Departments
//
//  Created by İbrahim Bayram on 21.02.2023.
//

import Foundation
import UIKit

struct DetailViewModel {
    var university : University?
    
    func updateLabels(adres : UILabel, name : UILabel, rector : UILabel, website : UILabel, email : UILabel, phone : UILabel) {
        guard let university = university else {return}
        adres.text = university.adress
        name.text = university.name
        rector.text = university.rector
        website.text = university.website
        email.text = university.email
        phone.text = university.phone
    }
    
}
