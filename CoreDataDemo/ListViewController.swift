//
//  LISTViewController.swift
//  CoreDataDemo
//
//  Created by MacBook on 25/03/2022.
//

import UIKit

protocol ListViewControllerDelegate {
    func data(object: [String : String], index: Int, isEdit: Bool)
}

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var student = [Student]()
    var delegate: ListViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        student =  DatabaseHelper.shareInstance.getStudentData()
        
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        student.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.student = student[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            student = DatabaseHelper.shareInstance.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let did = ["name":student[indexPath.row].name,
                   "address":student[indexPath.row].address,
                   "city":student[indexPath.row].city,
                   "mobile":student[indexPath.row].mobile]
        
        delegate.data(object: did as! [String : String], index: indexPath.row, isEdit: true)
        self.navigationController?.popViewController(animated: true)
        
    }
    
     
}
