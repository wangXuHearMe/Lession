//
//  MainHeaderView.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/18.
//

import UIKit

class MainHeaderView: UIView {
  var avaterUrl: String?
  var username: String?

  private var headerView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemOrange
    return view
  }()

  private var lineView: UIView = {
    let view = UIView()
    view.backgroundColor = .black
    return view
  }()

  private var avaterButton: UIButton = {
    let btn = UIButton()
//    btn.setImage(UIImage.init(named: "m"), for: .normal)
    btn.setBackgroundImage(UIImage.init(named: "m"), for: .normal)
    btn.addTarget(self, action: #selector(touchAvater), for: .touchUpInside)
    btn.layer.cornerRadius = 20
    btn.layer.masksToBounds = true
    return btn
  }()

  private var nameLabel: UILabel = {
    let label = UILabel()
    label.text = "wangx"
    label.textColor = .white
    label.font = .systemFont(ofSize: 19)
    label.textAlignment = .left
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupUI() {
    addSubview(headerView)
    headerView.snp.makeConstraints { make in
      make.left.right.top.bottom.equalToSuperview()
    }

    addSubview(lineView)
    lineView.snp.makeConstraints { make in
      make.width.equalToSuperview()
      make.height.equalTo(1)
      make.top.equalTo(headerView.snp_bottom)
    }

    headerView.addSubview(avaterButton)
    avaterButton.snp.makeConstraints { make in
      make.left.equalTo(headerView.snp_left).offset(18)
      make.height.width.equalTo(40)
      make.bottom.equalTo(lineView.snp_top).offset(-5)
    }

    headerView.addSubview(nameLabel)
    nameLabel.snp.makeConstraints { make in
      make.left.equalTo(avaterButton.snp_right).offset(7)
      make.width.equalTo(200)
      make.height.equalTo(25)
      make.centerY.equalTo(avaterButton)
    }
  }

  func renderUI() {

  }

  @objc func touchAvater() {
    print("touchAvater")
  }
}
