//
//  FirstTableViewController.swift
//  CellProtocolDemo
//
//  Created by 조준오 on 2018/08/02.
//  Copyright © 2018 조준오. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {

    @IBOutlet var table1: UITableView!
    @IBAction func button1(_ sender: UIButton) {
        let indexPath = table1.indexPath(for: sender.superview!.superview as! UITableViewCell)
        array1[indexPath!.row] = "Clicked"
        table1.reloadData()
    }
    
    var array1: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in (1...20) {
            array1.append("Title \(String(i))")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array1.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse1", for: indexPath)
        
        guard let customCell = cell as? FirstTableViewCell else{
            return cell
        }

        customCell.titleLabel.text = array1[indexPath.row]
        
        return cell
    }

}

class FirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
