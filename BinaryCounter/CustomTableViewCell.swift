//
//  CustomTableViewCell.swift
//  BinaryCounter
//
//  Created by admin on 07/12/2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var powerLabel: UILabel!
    var delegate: ChangeValue?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func add(_ sender: UIButton) {
        guard let numberString = powerLabel.text else { return }
        let number = Int(numberString) ?? 0
        delegate?.addToValue(number: number)
    }
    
    @IBAction func miness(_ sender: UIButton) {
        guard let numberString = powerLabel.text else { return }
        let number = Int(numberString) ?? 0
        delegate?.minessFromValue(number: number)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol ChangeValue {
    func addToValue(number: Int)
    func minessFromValue(number: Int)
}
