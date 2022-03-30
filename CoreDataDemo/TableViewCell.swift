//
//  TableViewCell.swift
//  CoreDataDemo
//
//  Created by MacBook on 25/03/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var mobileLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    var student: Student! {
        didSet {
            nameLbl.text = student.name
            addressLbl.text = student.address
            cityLbl.text = student.city
            mobileLbl.text = student.mobile
        }
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
