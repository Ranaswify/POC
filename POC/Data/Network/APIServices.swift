//
//  LoginService.swift
//  POC
//
//  Created by Amanah1 on 16/09/2022.
//

import Foundation
import UIKit
import Alamofire

class APIServices
{
    func GetOrders() {
        let token : String = UserDefaults.value(forKey:"token") as! String
        let teamId : String = UserDefaults.value(forKey:"teamId") as! String
        let headers = [
        "Content-Type" : "application/json",
        "LanguageId" : "2",
        "Authorization":token
        ]
        
        Alamofire.request("api/order/GetTeamOrdersForMobile?teamId="+teamId+"&pageNo=1"+"&pageSize=10", method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in switch response.result {
        case .success(let JSON):
            print("Success with JSON: \(JSON)")

            let response = JSON as! NSDictionary
            if let jsonP = response["data"] as? [String:Any]
            {
                let token = jsonP["token"] as? String
                let teamId = jsonP["teamId"] as? Int
                            
                UserDefaults.standard.set(token, forKey:"token")
                UserDefaults.standard.set(teamId, forKey:"teamId")
            }
           
        case .failure(let error):
            print("Request failed with error: \(error)")
        }
           
        }
    }
    
    func getData<T: Decodable, E: Decodable>(url: String, method: HTTPMethod ,params: Parameters?, encoding: ParameterEncoding ,headers: HTTPHeaders? ,completion: @escaping (T?, E?, Error?)->()) {
            
            Alamofire.request(url, method: method, parameters: params, encoding: encoding, headers: headers)
                .validate(statusCode: 200...300)
                .responseJSON { (response) in
                    switch response.result {
                    case .success(_):
                        guard let data = response.data else { return }
                        do {
                            let jsonData = try JSONDecoder().decode(T.self, from: data)
                            completion(jsonData, nil, nil)
                        } catch let jsonError {
                            print(jsonError)
                        }
                        
                    case .failure(let error):
                        // switch on Error Status Code
                        guard let data = response.data else { return }
                        guard let statusCode = response.response?.statusCode else { return }
                        switch statusCode {
                        case 400..<500:
                            do {
                                let jsonError = try JSONDecoder().decode(E.self, from: data)
                                completion(nil, jsonError, nil)
                            } catch let jsonError {
                                print(jsonError)
                            }
                        default:
                            completion(nil, nil, error)
                        }
                    }
            }
        }
    
    func Login(username:String, password: String)
    {
        
        let parameters = [
            "username":username,
            "password":password,
            "grant_type":"password",
            "clientId":"3",
            "secret":"d",
            "deviceId" : ""
        ]
        
        let headers = [
        "Content-Type" : "application/json",
        "LanguageId" : "2"
        ]
        
        Alamofire.request("https://e-amanahkwt.com/DevBack/api/Technician/Login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in switch response.result {
        case .success(let JSON):
            print("Success with JSON: \(JSON)")

            let response = JSON as! NSDictionary
            if let jsonP = response["data"] as? [String:Any]
            {
                let token = jsonP["token"] as? String
                let teamId = jsonP["teamId"] as? Int
                            
                UserDefaults.standard.set(token, forKey:"token")
                UserDefaults.standard.set(teamId, forKey:"teamId")
            }
           
        case .failure(let error):
            print("Request failed with error: \(error)")
        }
           
        }
        
        
    }
}
