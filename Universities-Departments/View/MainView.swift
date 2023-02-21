//
//  ViewController.swift
//  Universities-Departments
//
//  Created by İbrahim Bayram on 18.02.2023.
//

import UIKit

class ViewController: UIViewController{
    var cellViewModel = TableViewCellViewModel()
    var listViewModel = ProvinceListViewModel()
    var selected : University?
    var uniList = [[University]]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                //print(self.uniList)
            }
        }
    }
    var provincelist = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                //print(self.provincelist)
            }
        }
    }
   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        listViewModel.getProvinces { [weak self] provinces, unis in
            print(unis)
            DispatchQueue.main.async {
                self?.provincelist = provinces
                self?.uniList = unis
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destVC = segue.destination as! DetailViewController
            destVC.selectedUni = selected!
        }
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return provincelist.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return provincelist[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellViewModel.cellForRowAt(arr: uniList, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellViewModel.numberOfRowsInSection(arr: uniList, section: section)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selected = uniList[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
}



