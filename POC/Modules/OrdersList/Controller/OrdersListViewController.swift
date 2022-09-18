//
//  OrdersListViewController.swift
//  POC
//
//  Created by Amanah1 on 17/09/2022.
//

import Foundation
import UIKit

class OrdersListViewController : UIViewController
{
    var orderView = OrdersListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderView.GetOrders()
    }
}
