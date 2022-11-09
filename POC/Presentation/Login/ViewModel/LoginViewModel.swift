//
//  LoginViewModel.swift
//  POC
//
//  Created by Amanah1 on 16/09/2022.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel
{
    var service = APIServices()
    
    var usernameBehavior = BehaviorRelay<String>(value: "")
    var passwordBehavior = BehaviorRelay<String>(value: "")

    
    func LoginUser(){
        service.Login(username: usernameBehavior.value, password: passwordBehavior.value)
        
    }
}

