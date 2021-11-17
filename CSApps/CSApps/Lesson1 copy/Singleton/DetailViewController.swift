//
//  DetailViewController.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var cashLabel: UILabel!
    
    let account = Account.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    nameLabel.text = account.name
    cashLabel.text = String(account.cash)
    }
}
