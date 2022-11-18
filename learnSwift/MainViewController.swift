//
//  MainViewController.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/18.
//

import UIKit

class MainViewController: UIViewController {

  private var headerView = MainHeaderView.init(frame: .zero)
  private lazy var tableView: UITableView = {
    let view = UITableView(frame: .zero, style: .plain)
    view.separatorStyle = .none
    view.dataSource = self
    view.delegate = self
    view.backgroundColor = .white
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  func setupUI() {
    view.backgroundColor = .white
    view.addSubview(headerView)
    headerView.snp.makeConstraints { make in
      make.height.equalTo((view.frame.height * 1 / 9) - 10)
      make.top.equalToSuperview()
      make.left.right.equalToSuperview()
    }

    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.top.equalTo(headerView.snp_bottom)
      make.left.right.bottom.equalToSuperview()
    }
  }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell.init(style: .default, reuseIdentifier: "1")
    return cell
  }
}
