//
//  LoginViewModel.swift
//  LoginRx
//
//  Created by jeremias serafim on 3/23/18.
//  Copyright © 2018 jeremiasdsa. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()) {e,p in
            (e.characters.count >= 3) && (p.characters.count>=3)
        }
    }
}
