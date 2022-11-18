//
//  TestTableViewCell.swift
//  learnSwift
//
//  Created by ByteDance on 2022/11/4.
//

import UIKit

class TestTableViewCell: UITableViewCell {
  
  var userLabel: UILabel!
  var birthdayLabel: UILabel!
  var sexLabel: UILabel!
  var iconImage: UIImageView!
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
