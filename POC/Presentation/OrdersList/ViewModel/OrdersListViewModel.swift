//
//  OrdersListViewModel.swift
//  POC
//
//  Created by Amanah1 on 10/10/2022.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

class OrdersListViewModel
{
    private var OrdersModelSubject = PublishSubject<[Orders]>()
        
        var OrdersModelObservable: Observable<[Orders]> {
            return OrdersModelSubject
        }
    
    
}

