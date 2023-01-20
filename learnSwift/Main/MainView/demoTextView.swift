//
//  demoTextView.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/21.
//

import UIKit

class demoTextView: UIView {

  var stackView: UIStackView = {
    let view = UIStackView()
    view.spacing = 4
    view.alignment = .leading
    view.axis = .horizontal
    return view
  }()

  private var backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()

  private var textView: UITextField = {
    let view = UITextField()
    view.placeholder = "search"
    view.textAlignment = .left
    view.keyboardType = .default
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  func setupUI() {
    addSubview(backgroundView)
    backgroundView.snp.makeConstraints { make in
      make.height.equalTo(50)
      make.left.right.equalToSuperview()
      make.top.equalToSuperview()
    }

    backgroundView.addSubview(stackView)
    stackView.isHidden = true
    stackView.snp.makeConstraints { make in
      make.left.equalTo(backgroundView.snp_left).offset(5)
      make.centerY.equalToSuperview()
    }

    backgroundView.addSubview(textView)
    textView.snp.makeConstraints { make in
      make.height.equalToSuperview()
      make.centerY.equalToSuperview()
      make.right.equalToSuperview()
      make.left.equalTo(stackView.snp_right).offset(10)
    }
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func changeStackView(image: UIImageView) {
    stackView.isHidden = false
    stackView.addArrangedSubview(image)
    image.layer.cornerRadius = 10
    image.layer.masksToBounds = true
    image.snp.makeConstraints { make in
      make.height.width.equalTo(20)
    }
  }
}
