//
//  ProfileViewController.swift
//  GreenGroceryMVVM
//
//  Created by MacBook Air on 31.03.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    lazy var label: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.backgroundColor = .systemBlue
        label.layer.cornerRadius = 12
        label.textColor = .white
        label.text = "Profile"
        label.textAlignment = .center
        label.clipsToBounds = true
       return label
   }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.view.backgroundColor = .systemBackground
        setupUI()
    }
    
   func setupUI() {
        self.view.addSubview(label)
       label.snp.makeConstraints { make in
           make.centerX.equalToSuperview()
           make.centerY.equalToSuperview()
           make.width.equalTo(70)
           make.height.equalTo(50)
       }
    }
}
