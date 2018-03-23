//
//  ViewController.swift
//  LoginRx
//
//  Created by jeremias serafim on 3/23/18.
//  Copyright © 2018 jeremiasdsa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginEnableLabel: UILabel!
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        _ = emailTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.emailText)
        _ = passwordTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.passwordText)
        
        _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled)
      
        loginViewModel.isValid.subscribe(onNext:{ [weak self] isValid in
            self?.loginEnableLabel.text = isValid ? "Enable" : "Not enable"
            self?.loginEnableLabel.textColor = isValid ? .green : .red
            print("isValid\(isValid)")
        }).disposed(by: disposeBag)
    }

}

