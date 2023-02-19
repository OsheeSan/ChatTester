//
//  ViewController.swift
//  ChatTester
//
//  Created by admin on 17.02.2023.
//

import UIKit
import FirebaseAuth

class ConversationViewController: UIViewController {
    
    let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         validateAuth()
    }
    
    func validateAuth(){
        if !isLoggedIn {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.modalTransitionStyle = .crossDissolve
            nav.navigationBar.tintColor = .orange
            present(nav, animated: true)
        }
    }

}

