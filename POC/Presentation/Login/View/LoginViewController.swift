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
        
        if usernameText.text != "" && passwordText.text != ""
        {
            viewModel.LoginUser(username: usernameText?.text ?? "", password: passwordText?.text ?? "")
        }
      
           
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "OrdersListView", bundle: nil)
        
        let vc=storyboard.instantiateViewController(identifier: "OrdersListView") as? OrdersListViewController
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
        //vc.modalPresentationStyle = .fullScreen
        //self.show(vc, sender: self)
       
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
   
}

