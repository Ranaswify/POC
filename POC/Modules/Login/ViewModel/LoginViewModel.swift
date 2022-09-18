//
//  LoginViewModel.swift
//  POC
//
//  Created by Amanah1 on 16/09/2022.
//

import Foundation

class LoginViewModel
{
    var service = LoginService()
    
    func LoginUser(username:String, password: String){
        service.Login(username: username, password: password)
        
    }
}

