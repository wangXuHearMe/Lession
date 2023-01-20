//
//  MainViewModel.swift
//  learnSwift
//
//  Created by wangXu on 2023/1/20.
//

import UIKit

final class MainViewModel: NSObject {
  override init() {
    super.init()
  }
}

extension MainViewModel: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    6
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    60
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: demoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "demo", for: indexPath) as! demoTableViewCell
    cell.senderUI()
    return cell
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    "m"
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    30
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
