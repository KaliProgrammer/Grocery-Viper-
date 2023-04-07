
import Foundation
import UIKit

typealias BagClosure = ((skuId: String, stepValue: Int)) -> Void

class AddBagControl: UIControl {
    
    var callback: BagClosure?
    
    var viewModel: CartValueViewModel!  {
        didSet {
            let isHidden = viewModel.showStepper
            addToBagButton.isHidden = isHidden
            plusButton.isHidden = !isHidden
            minusButton.isHidden = !isHidden
            stepperLabel.isHidden = !isHidden
            stepperLabel.text = "\(viewModel.stepValue)"
        }
    }
    
    lazy var addToBagButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(addToBag), for: .touchUpInside)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 0
        button.clipsToBounds = true
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(incrementButton), for: .touchUpInside)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)

        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(decrementButton), for: .touchUpInside)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)

        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
     lazy var stepperLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.backgroundColor = .systemRed
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
   
    //MARK: - Selectors
    
    @objc func addToBag() {
        self.viewModel = self.viewModel.onAddToBag()
        self.callback?((viewModel.skuId,viewModel.stepValue))
    }
    
    @objc func incrementButton() {
        self.viewModel = self.viewModel.onIncrement()
        self.callback?((viewModel.skuId,viewModel.stepValue))
    }
    
    @objc func decrementButton() {
        self.viewModel = self.viewModel.onDecrement()
        self.callback?((viewModel.skuId,viewModel.stepValue))
    }
    
    //MARK: - Functions
    
    
    func configure(usingViewModel viewModel: CartValueViewModel, bagClosure: @escaping BagClosure) {
        self.viewModel = viewModel
        self.addToBagButton.setTitle(viewModel.title, for: .normal)
        self.callback = bagClosure
    }
}
