//
//  infoTableViewController.swift
//  classical_reading
//
//  Created by 남기범 on 13/05/2019.
//  Copyright © 2019 남기범. All rights reserved.
//

import UIKit

class infoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 13
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 89
        }
        else if indexPath.row < 3 {
            return 102
        }
        else if indexPath.row < 4 {
            return 89
        }
        else if indexPath.row < 9 {
            return 102
        }
        else if indexPath.row < 10 {
            return 89
        }
        else{
            return 102
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")!
            return cell
        }
        else if indexPath.row < 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")!
            return cell
        }
        else if indexPath.row < 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3")!
            return cell
        }
        else if indexPath.row < 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4")!
            return cell
        }
        else if indexPath.row < 10 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell5")!
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell6")!
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            dismiss(animated: true, completion: nil)
        }
    }

}
