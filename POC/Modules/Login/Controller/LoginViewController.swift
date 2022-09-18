//
//  LoginView.swift
//  POC
//
//  Created by Amanah1 on 15/09/2022.
//

import UIKit

class LoginViewController : UIViewController
{
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    var viewModel:LoginViewModel! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel=LoginViewModel()
    }
    @IBAction func login(_ sender: Any) {
        viewModel.LoginUser(username: usernameText?.text ?? "", password: passwordText?.text ?? "")
           
        
    }
    
}
