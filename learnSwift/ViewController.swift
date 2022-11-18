//
//  ViewController.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/4.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellid = "tableViewCellID"
    var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
    if cell == nil {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
    }
    cell?.textLabel?.text = "test"
    cell?.detailTextLabel?.text = "content"
    cell?.imageView?.image = nil
    return cell!
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    44
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    print(index)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let tableView = UITableView(frame: view.bounds, style: .grouped)
    tableView.backgroundColor = UIColor.white
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
  }


}

