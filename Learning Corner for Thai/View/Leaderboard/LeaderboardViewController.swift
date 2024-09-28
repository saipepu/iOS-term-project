//
//  LeaderboardViewController.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 29/08/2024.
//

import UIKit

class LeaderboardViewController: UIViewController {

    private let usersVM : GetAllUserViewModel

    
    private var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    init(usersVM: GetAllUserViewModel ) {
            self.usersVM = usersVM
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Leaderboard"
        self.setUpUI()
        self.setUpConstraints()
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    

    fileprivate func setUpUI(){
        view.addSubview(tableView)
        tableView.register(LeaderboardCell.self, forCellReuseIdentifier: Constants.leaderboardCellIdentifier)
        
    }
    
    
  
    fileprivate func setUpConstraints() {
        if let users = usersVM.userData {
            let tableViewHeight = CGFloat(  users.count * 50)
        NSLayoutConstraint.activate([
          
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.heightAnchor.constraint(equalToConstant: tableViewHeight),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -24),
                
                
                
                ])
            }
    }
    
    

}

extension LeaderboardViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let allUsers = usersVM.userData else {
            print("No users found")
            return 0
        }
        print("Number of users: \(allUsers.count)") // Debugging log
        return allUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.leaderboardCellIdentifier, for: indexPath) as! LeaderboardCell
         
         guard let users = usersVM.userData else { return cell }
         
         print("Configuring cell at row: \(indexPath.row) for user: \(users[indexPath.row])") // Debugging log
         
         cell.configure(at: indexPath, user: users[indexPath.row])
         
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
