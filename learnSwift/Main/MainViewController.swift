//
//  MainViewController.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/18.
//

import UIKit

final class MainViewController: UIViewController {
  private var viewModel = MainViewModel()

  private var headerView = MainHeaderView.init(frame: .zero)
  private var searchView = SearchView()

  private lazy var tableView: UITableView = {
    let view = UITableView(frame: .zero, style: .grouped)
    view.separatorStyle = .none
    view.dataSource = viewModel
    view.delegate = viewModel
    view.backgroundColor = .white
    view.register(demoTableViewCell.self, forCellReuseIdentifier: "demo")
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = true
    setupUI()
  }

  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(headerView)
    headerView.snp.makeConstraints { make in
      make.height.equalTo((view.frame.height * 1 / 9))
      make.top.equalToSuperview()
      make.left.right.equalToSuperview()
    }

    view.addSubview(searchView)
    searchView.snp.makeConstraints { make in
      make.top.equalTo(headerView.snp_bottom)
      make.height.equalTo(50)
      make.left.right.equalToSuperview()
    }

    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.top.equalTo(searchView.snp_bottom)
      make.left.right.bottom.equalToSuperview()
    }

    searchView.isUserInteractionEnabled = true
    let tap = UITapGestureRecognizer(target: self, action: #selector(clickSearchView))
    tap.numberOfTapsRequired = 1
    searchView.addGestureRecognizer(tap)
  }

  @objc private func clickSearchView() {
    let vc = SearchViewController()
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true)
  }
}
