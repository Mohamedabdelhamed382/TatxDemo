//
//  MainScreenVC.swift
//  TatxDemo
//
//  Created by MOHAMED ABD ELHAMED AHMED on 15/02/2022.
//

import UIKit

class MainScreenVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

   
}

extension MainScreenVC {
    
    func setup() {
        configureTableView()
        registerNib()
        //setupTableViewHeaderView()
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func registerNib(){
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
    
//    private func setupTableViewHeaderView() {
//        let headerView = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 182))
//        tableView.tableHeaderView = headerView
//    }
//
}

extension MainScreenVC:UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    

}

