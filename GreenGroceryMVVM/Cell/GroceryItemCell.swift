import UIKit
import SnapKit

class GroceryItemCell: UITableViewCell {
    
    let viewModelButton = CartValueViewModel(skuId: "1", stepValue: 0)

    let control = AddBagControl()
    
     lazy var groceryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
     lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
     lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
     lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        control.configure(usingViewModel: viewModelButton) { _ in
            
        }
        setupUI()
        setupUIButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupUIButton() {
        self.contentView.addSubview(control.addToBagButton)
        self.contentView.addSubview(control.plusButton)
        self.contentView.addSubview(control.minusButton)
        self.contentView.addSubview(control.stepperLabel)

        control.addToBagButton.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(50)
            make.height.equalTo(40)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-3)
            make.width.equalTo(126)
        }
        control.plusButton.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(50)
            make.height.equalTo(40)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-3)
            make.width.equalTo(40)
        }
        control.minusButton.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(50)
            make.height.equalTo(40)
            make.trailing.equalTo(control.stepperLabel.snp.leading).offset(-3)
            make.width.equalTo(40)
        }
        control.stepperLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(50)
            make.height.equalTo(40)
            make.trailing.equalTo(control.plusButton.snp.leading).offset(-3)
            make.width.equalTo(40)
        }
    }
    
    func setupUI() {
        self.contentView.addSubview(groceryImage)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(priceLabel)
        
        groceryImage.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(12)
            make.leading.equalTo(self.contentView.snp.leading).offset(16)
            make.height.width.equalTo(40)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.leading.equalTo(groceryImage.snp.trailing).offset(3)
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.equalTo(groceryImage.snp.trailing).offset(3)
            make.height.equalTo(20)
            make.width.equalTo(280)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.equalTo(groceryImage.snp.trailing).offset(3)
            make.height.equalTo(20)
            make.width.equalTo(60)
        }  
    }
    
    func configure(using viewModel: GroceryItemViewModel, addToCartClosure: @escaping BagClosure) {
        self.nameLabel.text = viewModel.title
        self.groceryImage.image = UIImage(named: viewModel.image)
        self.descriptionLabel.text = viewModel.details
        self.priceLabel.text = viewModel.price
        self.control.configure(usingViewModel: viewModel.cartValue, bagClosure: addToCartClosure)
        self.selectionStyle = .none
    }
}
