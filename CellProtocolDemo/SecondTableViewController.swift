//
//  SecondTableViewController.swift
//  CellProtocolDemo
//
//  Created by 조준오 on 2018/08/02.
//  Copyright © 2018 조준오. All rights reserved.
//

import UIKit

protocol SecondTableDelegate {
    func secondTableManipulate(_ sender: SecondTableViewCell)
}

class SecondTableViewController: UITableViewController, SecondTableDelegate {
    func secondTableManipulate(_ sender: SecondTableViewCell) {
        guard let indexPath = table2.indexPath(for: sender) else { return }
        
        array2[indexPath.row] = "Clicked"
                table2.reloadData()
    }
    

    @IBOutlet var table2: UITableView!
    
    var array2: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in (1...20) {
            array2.append("Title \(String(i))")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array2.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse2", for: indexPath)

        guard let customCell = cell as? SecondTableViewCell
            else{
        return cell
        }

        customCell.titleLabel.text = array2[indexPath.row]
        
        customCell.delegate = self

        return cell
    }

}

class SecondTableViewCell: UITableViewCell {
    
    var delegate: SecondTableDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func button2(_ sender: UIButton) {
        delegate?.secondTableManipulate(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
