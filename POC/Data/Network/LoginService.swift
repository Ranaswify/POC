//
//  LoginService.swift
//  POC
//
//  Created by Amanah1 on 16/09/2022.
//

import Foundation
import UIKit

class LoginService
{
    
    func Login(username:String, password: String) {
        guard let apiURL = URL(string: "https://e-amanahkwt.com/DevBack/api/Technician/Login") else{
        return
        }
        
        print("hi")
        var request=URLRequest(url: apiURL)
        
        request.httpMethod="POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        request.setValue("1", forHTTPHeaderField: "LanguageId")
        let body:[String:AnyHashable] = [
            "username":username,
            "password":password,
            "grant_type":"password",
            "clientId":"3",
            "secret":"d"
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task=URLSession.shared.dataTask(with: request){
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let response = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                
               if let jsonP = response!["data"] as? [String:Any]
               {
                let token = jsonP["token"] as? String
                let teamId = jsonP["teamId"] as? String
                
                UserDefaults.standard.set(token, forKey:"token")
                UserDefaults.standard.set(teamId, forKey:"teamId")

               }
                
            }
            catch
            {
                print("Error: \(error)")
            }
        }
        task.resume()
    }
}
