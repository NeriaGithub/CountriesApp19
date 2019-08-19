//
//  ViewController.swift
//  CountriesApp19
//
//  Created by Neria Jerafi on 19/08/2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sortByABC: UIButton!
    @IBOutlet weak var sortBySize: UIButton!
    @IBOutlet var countriesTable: CountiresTableView!
    var selectedCountry:Country?
    var isCheckedABC:Bool = true
    var isCheckedSize:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        DispatchQueue.global(qos: .background).async {
            ServerManager.getSharedInstance().getCountriesJson(completion: { (data) in
                if data != nil{
                    
                    self.countriesTable.countriesArray = data!.sorted(by: {$0.name ?? "" < $1.name ?? ""})
                    
                    
                    self.countriesTable.countyTableDelege = self
                    DispatchQueue.main.async {
                        self.countriesTable.table.reloadData()
                    }
                    
                }
            })
        }
    }
    
    @IBAction func sortByABC(_ sender: UIButton) {
        self.sortBySize.setTitle("sort by size", for: .normal)
        self.sortBySize.setTitleColor(self.view.tintColor, for: .normal)
        self.isCheckedABC = !self.isCheckedABC
        if self.isCheckedABC{
            sender.setTitle("A-Z", for: .normal)
            sender.setTitleColor(.green, for: .normal)
            self.countriesTable.countriesArray = self.countriesTable.countriesArray.sorted(by: {$0.name ?? "" < $1.name ?? ""})
        }
        else{
            sender.setTitle("Z-A", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            self.countriesTable.countriesArray = self.countriesTable.countriesArray.sorted(by: {$0.name ?? "" > $1.name ?? ""})
        }
        self.countriesTable.table.reloadData()
    }
    
    @IBAction func sortBySize(_ sender: UIButton) {
        self.sortByABC.setTitle("sort by ABC", for: .normal)
        self.sortByABC.setTitleColor(self.view.tintColor, for: .normal)
        self.isCheckedSize = !self.isCheckedSize
        if self.isCheckedSize{
            sender.setTitle("Low->high", for: .normal)
            sender.setTitleColor(.green, for: .normal)
            self.countriesTable.countriesArray = self.countriesTable.countriesArray.sorted {$0.area ?? 0 < $1.area ?? 0}
        }
        else{
            sender.setTitle("higt->low", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            self.countriesTable.countriesArray = self.countriesTable.countriesArray.sorted {$0.area ?? 0 > $1.area ?? 0}
    }
    self.countriesTable.table.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CountryViewController
        vc.selectedCountry = self.selectedCountry
    }
}
extension ViewController:CountryDelegate{
    func showAlert() {
        let alert = UIAlertController(title: Constants.alertTitle, message: nil, preferredStyle: UIAlertController.Style.alert);
        alert.addAction(UIAlertAction(title: "close", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func selectedCountry(country: Country) {
        self.selectedCountry = country
        performSegue(withIdentifier: "countrySegue", sender: self)
    }
    
    
}

