//
//  LoginPresenter.swift
//  bancom
//
//  Created by Renzo Paul Chamorro on 15/03/24.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol {
    func viewDidLoad()
    func verifyLogin(user: String?,
                     pass: String?)
    func toggleCheckbox()
    func toggleShowPass()
}

class LoginPresenter {
    
    weak var view: LoginViewProtocol?
    private var isCheckboxSelected = false
    private var isPassVisibleSelected = false
    
    private func pushHomeScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "HomeViewController",
                                                    bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        view?.pushHomeScreen(vc: newViewController)

    }
    
    private func manageSavedUser(user: String?) {
        guard let user = user else { return }
        let defaults = UserDefaults.standard
        if isCheckboxSelected {
            defaults.set(user, forKey: Constants.UsernameKey)
        } else {
            defaults.removeObject(forKey: Constants.UsernameKey)
        }
        
    }
    
    private func loginError() {
        view?.setMailViewErrorInput(error: true)
        view?.setPassViewErrorInput(error: true)
        view?.showAlert(message: "Usuario o contraseña incorrectos")
    }
    
    private func getSavedUser() {
        let defaults = UserDefaults.standard
        let userName = defaults.string(forKey: Constants.UsernameKey)
        guard let safeUserName = userName,
                safeUserName != "" else { return }
        view?.updateLoginUsername(user: safeUserName)
        view?.updateCheckBox(value: true)
        isCheckboxSelected = true
    }
    
}

extension LoginPresenter: LoginPresenterProtocol {
    func viewDidLoad() {
        getSavedUser()
    }
    func toggleCheckbox() {
        isCheckboxSelected.toggle()
        view?.updateCheckBox(value: isCheckboxSelected)
    }
    
    func toggleShowPass() {
        isPassVisibleSelected.toggle()
        view?.updatePassSecureEntry(value: isPassVisibleSelected)
    }
    
    func verifyLogin(user: String?,
                     pass: String?) {
        if user != Constants.dummyMail ||
            pass != Constants.dummyPass {
            loginError()
        } else {
            view?.setMailViewErrorInput(error: false)
            view?.setPassViewErrorInput(error: false)
            pushHomeScreen()
            manageSavedUser(user: user)
        }
    }
}
