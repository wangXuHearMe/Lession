//
//  SearchViewController.swift
//  learnSwift
//
//  Created by wangXu on 2023/1/20.
//

import UIKit

final class SearchViewController: UIViewController {
  private let searchView = SearchView()
  private let viewModel = SearchViewModel()
//  private let swipe = UISwipeGestureRecognizer(target: self, action: #selector(dismissViewController))

  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.delegate = viewModel
    tableView.dataSource = viewModel
    tableView.register(demoTableViewCell.self, forCellReuseIdentifier: "demo")
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = false
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setupUI()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  private func setupUI() {
    view.backgroundColor = .white

    view.addSubview(searchView)
    searchView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(50)
      make.left.right.equalToSuperview()
      make.height.equalTo(50)
    }

    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.top.equalTo(searchView.snp_bottom)
      make.bottom.equalToSuperview()
      make.width.equalToSuperview()
    }
//    tableView.addGestureRecognizer(swipe)
//    swipe.direction = .right
  }

  @objc private func dismissViewController() {
    dismiss(animated: true)
  }
}
