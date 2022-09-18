//
//  LoginResponse.swift
//  POC
//
//  Created by Amanah1 on 17/09/2022.
//

import Foundation

struct LoginResponse : Codable {
    
    let methodName : String
    let isSucceeded : Bool
    let results: LoginResponseData
}
struct LoginResponseData : Codable {
    
    let token : String

}
