//
//  MainViewController.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/18.
//

import UIKit

class MainViewController: UIViewController {

  private var headerView = MainHeaderView.init(frame: .zero)
  private var headerTextView = demoTextView.init(frame: .zero)

  private lazy var tableView: UITableView = {
    let view = UITableView(frame: .zero, style: .plain)
    view.separatorStyle = .none
    view.dataSource = self
    view.delegate = self
    view.backgroundColor = .white
    view.register(demoTableViewCell.self, forCellReuseIdentifier: "demo")
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

    view.addSubview(headerTextView)
    headerTextView.snp.makeConstraints { make in
      make.top.equalTo(headerView.snp_bottom)
      make.height.equalTo(50)
      make.left.right.equalToSuperview()
    }

    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.top.equalTo(headerTextView.snp_bottom)
      make.left.right.bottom.equalToSuperview()
    }
  }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    6
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    60
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = UITableViewCell.init(style: .default, reuseIdentifier: "demo")
    let cell: demoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "demo", for: indexPath) as! demoTableViewCell
    cell.senderUI()
    cell.selectionStyle = .none
    cell.selectionButton = { [weak self] tempURL in
      guard let self = self else { return }

      let eimgae = UIImageView()
      eimgae.image = UIImage.init(named: tempURL)
      self.headerTextView.changeStackView(image: eimgae)
    }
    return cell
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    "m"
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    30
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
