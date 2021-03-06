//
//  GroupsViewController.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation
import RealmSwift

class GroupsViewController: Object, UITableViewController {
    
    @objc dynamic var groupsOfSearchingAPI = GroupsOfSearchingAPI()
    @objc dynamic var groupsDataBase = GroupsDataBase()
    @objc dynamic var groups: Results<GroupModel>?
    @objc dynamic var token: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        groupsOfSearchingAPI.getGroups4 { [weak self] friends in
            
            guard let self = self else { return }
            
            self.groupsDataBase.save(groups)
            
            self.groups = self.groupsDataBase.load()
                    
            self.token = self.groups?.observe { [weak self] changes in
                        guard let self = self else { return }
                
                switch changes {
                case .initial:
                    self.tableView.reloadData()
                            case .update(_, let deletions, let insertions, let modifications):
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.endUpdates()
                            case .error(let error):
                                fatalError("\(error)")
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let groups = groups else { return 0 }
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let group = groups?[indexPath.row]
        
        cell.textLabel?.text = group.fullName
        
       
        }
        
        return cell
    }
}
