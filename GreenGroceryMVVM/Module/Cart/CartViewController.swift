
import UIKit
import SnapKit

class CartViewController: UIViewController {
    
    lazy var label: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.backgroundColor = .systemBlue
        label.textColor = .black
        label.layer.cornerRadius = 12
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Cart"
        label.clipsToBounds = true
       return label
   }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
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
