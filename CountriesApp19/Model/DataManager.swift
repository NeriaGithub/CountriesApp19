//
//  DataManager.swift
//  CountriesApp19
//
//  Created by Neria Jerafi on 19/08/2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//


import Foundation

class DataManager {
    
    private static var sharedInstance:DataManager?;
    private var countriesDict:[String:Country] = [:];
    private init(){}
    
    public static func getSharedInstance()->DataManager
    {
        if DataManager.sharedInstance == nil{
            DataManager.sharedInstance = DataManager();
        }
        return DataManager.sharedInstance!
    }
    
    func setCountries(countries:[Country]) {
        for country in countries {
            self.countriesDict[country.alpha3Code!] = country
            
        }
    }
    
    func getCountriesDict() -> [String:Country] {
        return self.countriesDict
    }
    
    
    
    func getSpesificCountry(countryId: String) -> Country?{ 
        if let country = self.countriesDict[countryId]{
            return country
        }
        return nil
        
    }
    
    
}
