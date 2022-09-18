//
//  OrdersListViewModel.swift
//  POC
//
//  Created by Amanah1 on 17/09/2022.
//

import Foundation

class OrdersListViewModel {
    
    var orderService = OrderService()
    
    func GetOrders() {
        orderService.GetAllOrders()
    }
}
