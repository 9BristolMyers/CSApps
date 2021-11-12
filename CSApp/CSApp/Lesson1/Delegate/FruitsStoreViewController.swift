//
//  FruitsStoreViewController.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation

class FruitsStoreViewController: UIViewController, ChooseFruitViewControllerDelegate {

    @IBOutlet weak var alphabetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    @IBAction func chooseAlphabetAction(_ sender: Any) {
        
        let ChooseFruitContoller = ChooseFruitViewController()
        ChooseFruitContoller.delegate = self
        
        
        navigationController?.pushViewController(animated: true)
    }
    
    func alphabetChosen(alphabetAction(_ String) {
        self.alphabetLabel.text = alphabet
    }
}
