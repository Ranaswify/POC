//
//  LoginView.swift
//  POC
//
//  Created by Amanah1 on 15/09/2022.
//

import UIKit
import RxSwift
import RxRelay

class LoginViewController : UIViewController
{
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    var viewModel:LoginViewModel! = nil

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LoginViewModel()
        bindTextFieldsToViewModel()
        
    }
    
    func bindTextFieldsToViewModel() {
        usernameText.rx.text.orEmpty.bind(to: viewModel.usernameBehavior).disposed(by: disposeBag)
        
            passwordText.rx.text.orEmpty.bind(to: viewModel.passwordBehavior).disposed(by: disposeBag)
    }
    
    @IBAction func login(_ sender: Any) {
        
        if usernameText.text != "" && passwordText.text != ""
        {
            viewModel.LoginUser()
            let token: String = UserDefaults.standard.string(forKey:"token") ?? ""
            
            if token != ""
            {
            let storyboard: UIStoryboard = UIStoryboard(name: "OrdersListView", bundle: nil)
            
            let vc=storyboard.instantiateViewController(identifier: "OrdersListView") as? OrdersListViewController
            
            self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
      
        
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

