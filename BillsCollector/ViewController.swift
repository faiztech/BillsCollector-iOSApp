//
//  ViewController.swift
//  BillsCollector
//
//  Created by Mohammed Faizuddin on 9/21/17.
//  Copyright © 2017 Faiz Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var bills :[Bill] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do
        {
            bills = try context.fetch(Bill.fetchRequest())
            print(bills)
            tableView.reloadData()
            
        } catch
        {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let bill  = bills[indexPath.row]
        cell.textLabel?.text = bill.title
        
        cell.imageView?.image = UIImage(data: bill.image as Data!)
        
        
        
        return cell
        
    }
  

}

