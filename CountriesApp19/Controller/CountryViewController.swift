//
//  CountryViewController.swift
//  CountriesApp19
//
//  Created by Neria Jerafi on 19/08/2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    
    @IBOutlet var bordersTable:
    CountiresTableView!
    
    var selectedCountry: Country?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVC()
    }
    func initVC()  {
        self.title = self.selectedCountry?.name!
        self.bordersTable.alphCode = self.selectedCountry?.alpha3Code
        for countryId in self.selectedCountry!.borders!{
            self.bordersTable.countriesArray.append(DataManager.getSharedInstance().getSpesificCountry(countryId: countryId)!)
        }
        self.bordersTable.table.reloadData()
        
        self.bordersTable.countyTableDelege = self
    }
}
extension CountryViewController: CountryDelegate{
    func selectedCountry(country: Country) {
        self.title = country.name!
    }
    
    func showAlert() {}
    
    
}

