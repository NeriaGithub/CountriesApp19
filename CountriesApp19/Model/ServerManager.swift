//
//  ServerManager.swift
//  CountriesApp19
//
//  Created by Neria Jerafi on 19/08/2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//



import Foundation
import Alamofire
class ServerManager {
    
    private static var sharedInstance:ServerManager?;
    private init(){
    }
    public static func getSharedInstance()->ServerManager
    {
        if ServerManager.sharedInstance == nil{
            ServerManager.sharedInstance = ServerManager();
        }
        return ServerManager.sharedInstance!
    }
    
    func getCountriesJson(completion:@escaping ([Country]?)->())  {
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else{return}
        AF.request(url).validate().responseData { response in
            if let response = response.value{
                do{
                    let countriesJson = try JSONDecoder().decode([Country].self,from: response);
                    DataManager.getSharedInstance().setCountries(countries: countriesJson)
                    completion(countriesJson)
                }
                catch{
                    completion(nil)
                }
            }
            else{
                completion(nil)
            }
        }
        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if data == nil{
//                completion(nil);
//            }
//            else{
//                do{
//                    let countriesJson = try JSONDecoder().decode([Country].self,from: data!);
//                    DataManager.getSharedInstance().setCountries(countries: countriesJson)
//                    completion(countriesJson)
//                }
//                catch{
//                    completion(nil)
//                }
//            }
//            }.resume()
    }
}
