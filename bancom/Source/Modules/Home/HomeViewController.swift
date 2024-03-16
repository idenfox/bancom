//
//  HomeViewController.swift
//  bancom
//
//  Created by Renzo Paul Chamorro on 15/03/24.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func popToLogin()
    func showAlert(message: String, alertAction: UIAlertAction?)
    func updateStoredPokemonColection(array: [PokemonModel])
}

class HomeViewController: UIViewController {
    
    var presenter = HomePresenter()

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var verticalCollectionView: UICollectionView!
    var sawPokemon = [PokemonModel(id: 1, name: "Bulbasur", type: "leaf", imgUrl: "www.google.com", level: nil),
                      PokemonModel(id: 2, name: "Ivysur", type: "leaf", imgUrl: "www.google.com", level: nil),
                      PokemonModel(id: 3, name: "Venasaur", type: "leaf", imgUrl: "www.google.com", level: nil),
                      PokemonModel(id: 4, name: "Squirtle", type: "water", imgUrl: "www.google.com", level: nil),
                      PokemonModel(id: 5, name: "Wartortle", type: "water", imgUrl: "www.google.com", level: nil)]
    
    var storedPokemon: [PokemonModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.viewDidLoad()
        profileImageView.layer.cornerRadius = 40
        collectionView.dataSource = self
        collectionView.delegate = self
        let nibName = UINib(nibName: "PokemonCollectionViewCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "PokemonCollectionViewCell")
        verticalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
        verticalCollectionView.register(nibName, forCellWithReuseIdentifier: "PokemonCollectionViewCell")
    }
    
    private func alertWithTextField(title: String? = nil, message: String? = nil, completion: @escaping (([String]) -> Void) = { _ in }) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField() { newTextField in
            newTextField.placeholder = "Nombre"
        }
        alert.addTextField() { newTextField in
            newTextField.placeholder = "Tipo"
        }
        alert.addTextField() { newTextField in
            newTextField.placeholder = "Nivel"
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in completion([]) })
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            var texts: [String] = []
            if let textFields = alert.textFields {
                for textField in textFields {
                    texts.append(textField.text ?? "")
                }
                completion(texts)
            } else {
                completion([])
            }
        })
        navigationController?.present(alert, animated: true)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        alertWithTextField(title: "Registrar Pokemon") { array in
            self.presenter.addPokemon(texts: array)
        }
    }
}

extension HomeViewController: HomeViewProtocol {
    func popToLogin() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showAlert(message: String, alertAction: UIAlertAction?) {
        let alert = UIAlertController(title: "Aviso",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        if alertAction != nil {
            alert.addAction(alertAction!)
        }
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func updateStoredPokemonColection(array: [PokemonModel]) {
        self.storedPokemon = array
        self.verticalCollectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return 1
        } else {
            return storedPokemon.count
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView {
            return sawPokemon.count
        } else {
            return 1
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.collectionView {
            UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        } else {
            UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as! PokemonCollectionViewCell
        if collectionView == self.collectionView {
            cell.configure(model: sawPokemon[indexPath.section])
        } else {
            cell.configure(model: storedPokemon[indexPath.row])
        }
        return cell
    }
}
