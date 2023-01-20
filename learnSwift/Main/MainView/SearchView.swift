//
//  SearchView.swift
//  learnSwift
//
//  Created by wangXu on 2023/1/20.
//

import UIKit

final class SearchView: UIView {
  private let contentView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()

  private let searchView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 0.945, green: 0.949, blue: 0.957, alpha: 1)
    view.layer.cornerRadius = 20
    view.layer.masksToBounds = true
    return view
  }()

  private let tipLabel: UILabel = {
    let label = UILabel()
    label.text = "搜索"
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = UIColor(red: 0.047, green: 0.047, blue: 0.102, alpha: 0.35)
    return label
  }()

  private let foundImage: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "found")
    return image
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    addSubview(searchView)
    searchView.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(10)
      make.right.equalToSuperview().offset(-10)
      make.top.equalToSuperview().offset(5)
      make.bottom.equalToSuperview().offset(-5)
    }

    let stackView: UIStackView = {
      let view = UIStackView()
      view.alignment = .center
      view.axis = .horizontal
      view.spacing = 5
      return view
    }()

    searchView.addSubview(stackView)
    stackView.addArrangedSubview(foundImage)
    foundImage.snp.makeConstraints { make in
      make.height.width.equalTo(16)
    }

    stackView.addArrangedSubview(tipLabel)
    stackView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.bottom.equalToSuperview()
    }
  }
}
