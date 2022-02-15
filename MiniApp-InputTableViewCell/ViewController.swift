//
//  ViewController.swift
//  MiniApp-InputTableViewCell
//
//  Created by 前田航汰 on 2022/02/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputNewCellTextField: UITextField!
    
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        inputNewCellTextField.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    // セクションの数確認する最初に。でも１つに決まってるから必要なくない？
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = textArray[indexPath.row]
        // cell.imageView!.image = UIImage(named: "wawo")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルがタップされた時に呼ばれるメソッド
        // タップした時にその配列の番号の中身を取り出して、値を渡す
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        detailVC.inputedString = textArray[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/8
    }
     */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textArray.append(inputNewCellTextField.text!)
        inputNewCellTextField.resignFirstResponder()
        inputNewCellTextField.text = ""
        tableView.reloadData()
        
        return true
    }
    
    

}

