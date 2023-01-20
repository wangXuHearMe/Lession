//
//  RegisterViewController.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/18.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {

  private var backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = .clear
    return view
  }()

  private var registerAvaterView = RegisterView.init(frame: .zero, type: .avater)
  private var registerPasswordView = RegisterView.init(frame: .zero, type: .password)
  private var surePasswordView = RegisterView.init(frame: .zero, type: .surePassword)

  private let disposBag = DisposeBag()

  private var registerButton: UIButton = {
    let btn = UIButton()
    btn.addTarget(RegisterViewController.self, action: #selector(touchRegister), for: .touchUpInside)
    btn.setTitle("注册", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.layer.cornerRadius = 20
    btn.backgroundColor = .systemMint
    return btn
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = false
    setNavController()
    setupUI()
  }

  func setupUI() {
    view.backgroundColor = .white
    view.addSubview(backgroundView)
    backgroundView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(view.snp_top).offset(300)
      make.height.equalTo(165)
      make.width.equalTo(300)
    }

    backgroundView.addSubview(registerAvaterView)
    registerAvaterView.snp.makeConstraints { make in
      make.top.left.right.equalTo(backgroundView)
      make.height.equalTo(45)
    }

    backgroundView.addSubview(registerPasswordView)
    registerPasswordView.snp.makeConstraints { make in
      make.top.equalTo(registerAvaterView.snp_bottom).offset(15)
      make.left.right.equalTo(backgroundView)
      make.height.equalTo(45)
    }

    backgroundView.addSubview(surePasswordView)
    surePasswordView.snp.makeConstraints { make in
      make.top.equalTo(registerPasswordView.snp_bottom).offset(15)
      make.left.right.equalTo(backgroundView)
      make.height.equalTo(45)
    }

    view.addSubview(registerButton)
    registerButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(backgroundView.snp_bottom).offset(30)
      make.height.equalTo(40)
      make.width.equalTo(70)
    }

    surePasswordView.textFiled.rx.text.asObservable()
      .subscribe (onNext: { [weak self] _ in
        guard let self = self else { return }
        self.checkPassWord()
      }).disposed(by: disposBag)
  }

  func setNavController() {
    self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(touchBack))
  }

  @objc func touchBack() {
    self.navigationController?.popViewController(animated: true)
  }

  @objc func touchRegister() {}

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    registerAvaterView.textFiled.endEditing(true)
    registerPasswordView.textFiled.endEditing(true)
    surePasswordView.textFiled.endEditing(true)
  }

  private func checkPassWord() {
    surePasswordView.hiddenErrorImage(surePasswordView.contentText == registerPasswordView.contentText)
  }
}
