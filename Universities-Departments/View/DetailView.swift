//
//  DetailViewController.swift
//  Universities-Departments
//
//  Created by İbrahim Bayram on 21.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedUni : University?
    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        testLabel.text = selectedUni?.adress
    }

}
