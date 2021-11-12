//
//  SendCashViewController.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation

class SendCashViewController: UIViewController {
    
    @IBOutlet weak var nemeTextField: UILabel!
    
    @IBOutlet weak var cashTextField: UILabel!
    
    let account = Account.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func sendCashAction(_ sender: Any) {
        
        guard let cashString = cashTextField.text,
              let cash = Int(cashString),
              let name = nameTextField.text
        else {
            return
        }
        
        account.name = name
        account.cash = cash
    }
}
