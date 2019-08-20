//
//  Country.swift
//  CountriesApp19
//
//  Created by Neria Jerafi on 19/08/2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//

import UIKit

struct Country:Decodable {
    let name: String?
    let nativeName: String? //if there is anything missing
    let alpha3Code:String?
    let borders:[String]?
    let area:Float?
    
    func getBordersCountries(selectedCountry:Country) -> [Country] {
        guard let borders = selectedCountry.borders  else {
            return  []
        }
        var  countries:[Country] = []
        for countryId in borders {
            if let country = DataManager.getSharedInstance().getSpesificCountry(countryId: countryId){
                countries.append(country)
            }
        }
        return countries
    }
}


