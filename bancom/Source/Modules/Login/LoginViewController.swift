//
//  ViewController.swift
//  bancom
//
//  Created by Renzo Paul Chamorro on 15/03/24.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func updateCheckBox(value: Bool)
    func updatePassSecureEntry(value: Bool)
    func updateLoginUsername(user: String)
    func setMailViewErrorInput(error: Bool)
    func setPassViewErrorInput(error: Bool)
    func showAlert(message: String)
    func pushHomeScreen(vc: UIViewController)
}

class LoginViewController: UIViewController {
    
    var presenter = LoginPresenter()

    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var passLabel: UILabel!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
        presenter.view = self
        presenter.viewDidLoad()
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
        presenter.toggleCheckbox()
    }
    @IBAction func showPassButtonTapped(_ sender: Any) {
        presenter.toggleShowPass()
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        presenter.verifyLogin(user: emailTextField.text,
                              pass: passwordTextField.text)
    }
}

extension LoginViewController: LoginViewProtocol {
    func updateLoginUsername(user: String) {
        DispatchQueue.main.async {
            self.emailTextField.text = user
        }
    }
    
    func updateCheckBox(value: Bool) {
        DispatchQueue.main.async {
            let image = value ? "iconBoxChecked" : "iconBox"
            self.checkboxImageView.image = UIImage(named: image)
        }
    }
    
    func updatePassSecureEntry(value: Bool) {
        DispatchQueue.main.async {
            self.passwordTextField.isSecureTextEntry = value
        }
    }
    
    func setMailViewErrorInput(error: Bool) {
        DispatchQueue.main.async {
            if error {
                self.mailView.customizeErrorBorder()
                self.mailLabel.textColor = .red.withAlphaComponent(0.8)
            } else {
                self.mailView.customizeBorder()
                self.mailLabel.textColor = .white
            }
        }
    }
    
    func setPassViewErrorInput(error: Bool) {
        DispatchQueue.main.async {
            if error {
                self.passwordView.customizeErrorBorder()
                self.passLabel.textColor = .red.withAlphaComponent(0.8)
            } else {
                self.passwordView.customizeBorder()
                self.passLabel.textColor = .white
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Aviso",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func pushHomeScreen(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

