//
//  OrderService.swift
//  POC
//
//  Created by Amanah1 on 17/09/2022.
//

import Foundation
import Alamofire

class OrderService
{
    
    func GetAllOrders() {
        let token = UserDefaults.standard.string(forKey:"token")
        let teamID = UserDefaults.standard.string(forKey:"teamId")

        let url = "https://e-amanahkwt.com/maintenanceback-staging/api/order/GetTeamOrdersForMobile?teamId=" + teamID! + "&PageNo=1&PageSize=10&culture=en"
        
        guard let apiURL = URL(string: url) else{
        return
        }
        
        var request=URLRequest(url: apiURL)
        
        request.httpMethod="GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Authorization", forHTTPHeaderField: "bearer " + token!)

        request.setValue("1", forHTTPHeaderField: "LanguageId")
        
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
                
                
                print("response: \(response)")
            }
            catch
            {
                print("Error: \(error)")
            }
        }
        task.resume()
   }
}
