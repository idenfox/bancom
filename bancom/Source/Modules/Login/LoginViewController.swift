//
//  ViewController.swift
//  bancom
//
//  Created by Renzo Paul Chamorro on 15/03/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var mailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var lostPassButton: UIButton!
    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var isCheckboxSelected = false
    private var isPassVisibleSelected = false
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
    }
    
    private func customizeViews() {
        mailView.customizeBorder()
        passwordView.customizeBorder()
        loginView.customizeBorder()
        googleView.customizeBorder()
        loginButton.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 20)
        googleButton.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 20)
        lostPassButton.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 14)
    }
    
    @IBAction func checkboxButtonTapped(_ sender: Any) {
        isCheckboxSelected.toggle()
        if isCheckboxSelected {
            checkboxImageView.image = UIImage(named: "iconBoxChecked")
        } else {
            checkboxImageView.image = UIImage(named: "iconBox")
        }
    }
    @IBAction func showPassButtonTapped(_ sender: Any) {
        isPassVisibleSelected.toggle()
        if isPassVisibleSelected {
            passwordTextField.isSecureTextEntry = true
        } else {
            passwordTextField.isSecureTextEntry = false
        }
    }
}

