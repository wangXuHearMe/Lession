//
//  RegisterView.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/18.
//

import UIKit

class RegisterView: UIView, UITextFieldDelegate {

  var backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray2
    view.layer.cornerRadius = 20
    view.layer.masksToBounds = true
    return view
  }()

  var type: nowType = .avater
  var leftImageView = UIButton()
  var errorImageView = UIButton()

  private var textFiled: UITextField = {
    let e = UITextField()
    e.clearButtonMode = .whileEditing
    e.adjustsFontSizeToFitWidth = true
    e.keyboardType = .default
    e.returnKeyType = .done
    e.textColor = .black
    e.isEnabled = true
    e.isUserInteractionEnabled = true
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
      make.centerX.equalToSuperview()
      make.width.equalTo(300)
      make.height.equalTo(45)
    }

    addSubview(leftImageView)
    leftImageView.snp.makeConstraints { make in
      make.left.equalTo(backgroundView.snp.left).offset(10)
      make.centerY.equalTo(backgroundView)
      make.height.width.equalTo(30)
    }

    addSubview(errorImageView)
    errorImageView.snp.makeConstraints { make in
      make.left.equalTo(backgroundView.snp.left).offset(10)
      make.centerY.equalTo(backgroundView)
      make.height.width.equalTo(30)
    }
    errorImageView.isHidden = true

    backgroundView.addSubview(textFiled)
    textFiled.delegate = self
    textFiled.snp.makeConstraints { make in
      make.left.equalTo(leftImageView.snp.right).offset(5)
      make.top.bottom.right.equalTo(backgroundView)
    }

    switch type {
    case .avater:
      leftImageView.setImage(UIImage.init(named: "LoginAvater"), for: .normal)
      textFiled.placeholder = "账号"
    case .password:
      leftImageView.setImage(UIImage.init(named: "LoginPassword"), for: .normal)
      textFiled.placeholder = "密码"
      textFiled.isSecureTextEntry = true
    case .surePassword:
      leftImageView.setImage(UIImage.init(named: "surePassword"), for: .normal)
      errorImageView.setImage(UIImage.init(named: "errorPassword"), for: .normal)
      textFiled.placeholder = "确认密码"
      textFiled.isSecureTextEntry = true
    }
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    textFiled.resignFirstResponder()
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    true
  }

  func changeImageView() {
    leftImageView.isHidden = true
    errorImageView.isHidden = false
  }

  enum nowType {
    case avater
    case password
    case surePassword
  }
}
