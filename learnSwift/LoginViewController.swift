//
//  LoginViewController.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/18.
//

import UIKit

class LoginViewController: UIViewController {
  private var backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = .clear
    return view
  }()

  private var loginAvaterView = LoginView.init(frame: .zero, type: .avater)
  private var loginPasswordView = LoginView.init(frame: .zero, type: .password)

  private var sureButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("登陆", for: .normal)
    btn.layer.cornerRadius = 10
    btn.setTitleColor(UIColor.black, for: .normal)
    btn.addTarget(self, action: #selector(touchSure), for: .touchUpInside)
    return btn
  }()

  private var registeredButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("注册", for: .normal)
    btn.layer.cornerRadius = 10
    btn.setTitleColor(UIColor.black, for: .normal)
    return btn
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  func setupUI() {
    view.backgroundColor = .white
    view.addSubview(backgroundView)
    backgroundView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(view).offset(370)
      make.width.equalTo(300)
      make.height.equalTo(100)
    }
    
    backgroundView.addSubview(loginAvaterView)
    loginAvaterView.snp.makeConstraints { make in
      make.left.right.equalToSuperview()
      make.top.equalToSuperview()
    }

    backgroundView.addSubview(loginPasswordView)
    loginPasswordView.snp.makeConstraints { make in
      make.top.equalTo(loginAvaterView).offset(55)
      make.left.right.equalToSuperview()
    }

    view.addSubview(sureButton)
    sureButton.snp.makeConstraints { make in
      make.left.equalTo(backgroundView.snp_left)
      make.top.equalTo(backgroundView.snp_bottom).offset(30)
      make.height.equalTo(40)
      make.width.equalTo(70)
    }

    view.addSubview(registeredButton)
    registeredButton.snp.makeConstraints { make in
      make.top.equalTo(backgroundView.snp_bottom).offset(30)
      make.height.equalTo(40)
      make.width.equalTo(70)
      make.right.equalTo(backgroundView.snp_right)
    }
  }

  @objc func touchSure() {
    let viewController = ViewController()
    self.present(viewController, animated: true)
  }
}

