//
//  HomeViewController.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/15/21.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    let authService = Auth.auth()
    
    let ref = Database.database().reference(withPath: "cities")

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func signOutAction(_ sender: Any) {
        
        try? authService.signOut()
        showLoginVC()
    }
    
    @IBAction func addCityAction(_ sender: Any) {
        
        let allert = UIAlertController(title: "Add city", message: nil, prefferedStyle: .alert)
        let cansel = UIAlertAction(title: "Отменить", style: .cansel, handler: nil)
        let save = UIAlertAction(title: "Сохранить город", style: .default) { _ in
            
            guard let textField = alert.textFields().first,
                  let cityName = textField.text else { return }
            
            let city = CityFirebase(name: cityName, zipcode: int.random(in 10000...999999))
            
            let cityContainerRef = self.ref.child(cityName)
            
            cityContainerRef.setValue(city.toAnyObject())
        }
        
        alert.addTextFielf()
        alert.addAction(cansel)
        alert.addAction(save)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func  showLoginVC() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else { return }
        guard let window = self.view.window else { return }
        window.rootViewController = vc
    }
}
