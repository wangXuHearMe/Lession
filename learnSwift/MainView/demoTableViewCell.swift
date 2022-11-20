//
//  demoTableViewCell.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/21.
//

import UIKit

class demoTableViewCell: UITableViewCell {

  private var avaterView = UIImageView()
  private var nameLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.textColor = .black
    label.font = .systemFont(ofSize: 18)
    return label
  }()

  private var descLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.textColor = .black
    label.font = .systemFont(ofSize: 16)
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupUI() {
    addSubview(avaterView)
    avaterView.image = UIImage.init(named: "m")
    avaterView.layer.cornerRadius = 20
    avaterView.snp.makeConstraints { make in
      make.height.width.equalTo(40)
      make.left.equalToSuperview().offset(10)
      make.top.equalToSuperview().offset(10)
    }

    addSubview(nameLabel)
    nameLabel.snp.makeConstraints { make in
      make.top.bottom.equalTo(avaterView)
      make.left.equalTo(avaterView.snp_right).offset(8)
    }

    addSubview(descLabel)
    descLabel.snp.makeConstraints { make in
      make.top.equalTo(avaterView.snp_bottom).offset(8)
      make.height.equalTo(20)
      make.width.equalToSuperview()
    }
  }

  func senderUI() {
    nameLabel.text = "mxySb"
    descLabel.text = "fix: wangx -> mxy"
  }

  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }
}

