//
//  LoginView.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/18.
//

import UIKit
import SnapKit

class LoginView: UIView {

  var backgroundView: UIView = {
    let view = UIView()
//    view.backgroundColor = .init(_colorLiteralRed: 241, green: 242, blue: 244, alpha: 1.0)
    view.backgroundColor = .systemGray2
    view.layer.cornerRadius = 20
    view.layer.masksToBounds = true
    return view
  }()

  var type: nowType = .avater
  var leftImageView = UIButton()
  var clearButton: UIButton = {
    let btn = UIButton()
    btn.setImage(UIImage.init(named: "clear"), for: .normal)
    return btn
  }()

  private var textFiled: UITextField = {
    let e = UITextField()
    e.clearButtonMode = .whileEditing
    return e
  }()

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(frame: CGRect, type: nowType) {
    super.init(frame: frame)
    self.type = type
    setupUI()
  }

  func setupUI() {
    addSubview(backgroundView)
    backgroundView.snp.makeConstraints { make in
      make.width.equalTo(300)
      make.height.equalTo(45)
    }

    addSubview(leftImageView)
    leftImageView.snp.makeConstraints { make in
      make.left.equalTo(backgroundView.snp.left).offset(10)
      make.centerY.equalTo(backgroundView)
      make.height.width.equalTo(30)
    }

    addSubview(textFiled)
    textFiled.snp.makeConstraints { make in
      make.left.equalTo(leftImageView.snp.right).offset(5)
      make.top.bottom.right.equalTo(backgroundView)
    }

    addSubview(clearButton)
    clearButton.snp.makeConstraints { make in
      make.right.equalTo(textFiled.snp.right).offset(-10)
      make.height.width.equalTo(30)
      make.centerY.equalTo(backgroundView)
    }

    switch type {
    case .avater:
      leftImageView.setImage(UIImage.init(named: "LoginAvater"), for: .normal)
      textFiled.placeholder = "账号"
    case .password:
      leftImageView.setImage(UIImage.init(named: "LoginPassword"), for: .normal)
      textFiled.placeholder = "密码"
    }
  }

  enum nowType {
    case avater
    case password
  }
}
