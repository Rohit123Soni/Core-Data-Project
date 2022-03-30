//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by MacBook on 25/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var index : Int = 0
    var isEdit: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveBtnPressed(_ sender: Any) {
        let dict = ["name":txtName.text,
                    "address":txtAddress.text,
                    "city":txtCity.text,
                    "mobile":txtMobile.text]
        if isEdit == true {
            DatabaseHelper.shareInstance.editData(object: dict as! [String: String], index: index)
        } else {
            DatabaseHelper.shareInstance.save(object: dict as! [String : String])
            var dialogMessage = UIAlertController(title: "Attention", message: "Data Saved Successfully", preferredStyle: .alert)
            // Present alert to user
            self.present(dialogMessage, animated: true, completion: nil)
            dismiss(animated: true, completion: nil)
            txtName.text=""
            txtAddress.text=""
            txtCity.text=""
            txtMobile.text=""
        }
    }
    
    @IBAction func showBtnPressed(_ sender: Any) {
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: ListViewControllerDelegate {
    func data(object: [String : String], index: Int, isEdit: Bool) {
        txtName.text = object["name"]
        txtAddress.text = object["address"]
        txtCity.text = object["city"]
        txtMobile.text = object["mobile"]
        self.index = index
        self.isEdit = isEdit
    }
}
