//
//  DetailViewController.swift
//  MiniApp-InputTableViewCell
//
//  Created by 前田航汰 on 2022/02/15.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var inputedTextLabel: UILabel!
    var inputedString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inputedTextLabel.text = inputedString
    }

}
