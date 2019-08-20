//
//  CountryDelegate.swift
//  CountriesApp19
//
//  Created by Neria Jerafi on 20/08/2019.
//  Copyright © 2019 MoranLeviLtd. All rights reserved.
//

import Foundation
protocol CountryDelegate {
    func selectedCountry(country: Country)
    func showAlert()
}
extension CountryDelegate{
    func showAlert() {}
}
