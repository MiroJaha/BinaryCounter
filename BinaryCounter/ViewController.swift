//
//  ViewController.swift
//  BinaryCounter
//
//  Created by admin on 07/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    var total = 0
    var arrayOfPower = [Int]()
    var cell = CustomTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        for i in 0..<16{
            arrayOfPower.append(Int(round(pow(10, Double(i)))))
        }
    }

    func updateTotal(){
        totalLabel.text = "Total: \(total)"
    }
    
    @objc func addPluss (sender: UIButton){
        total += arrayOfPower[sender.tag]
        updateTotal()
    }
    
    @objc func minessNumber (sender: UIButton){
        total -= arrayOfPower[sender.tag]
        updateTotal()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfPower.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! CustomTableViewCell
        
        self.cell.powerLabel.text = String(arrayOfPower[indexPath.row])
        
        self.cell.plusButton.tag = indexPath.row
        self.cell.minessButton.tag = indexPath.row
        
        self.cell.plusButton.addTarget(self, action: #selector(addPluss), for: .touchUpInside)
        self.cell.minessButton.addTarget(self, action: #selector(minessNumber), for: .touchUpInside)
        
        return self.cell
    }
}
